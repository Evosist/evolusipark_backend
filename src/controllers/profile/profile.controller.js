const errorhandler = require('../../helpers/errorhandler.helper')
const { user, level_pengguna, perusahaan } = require('../../models/index')
const argon = require('argon2')
const dayjs = require('dayjs')
const fs = require('fs')
const puppeteer = require('puppeteer')

function generateTableRows(data) {
    return data
        .map(
            (item) => `
    <tr>
      <td>${item.no}</td>
      <td>${item.nama}</td>
      <td>${item.jenis_kelamin}</td>
      <td>${item.no_hp}</td>
      <td>${item.alamat_lengkap}</td>
      <td>${item.level_pengguna?.nama || '-'}</td>
      <td>${item.status}</td>
      <td>${item.created}</td>
      <td>${item.updated}</td>
    </tr>
  `
        )
        .join('')
}

module.exports = {
    getAll: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await user.findAndCountAll({
                include: [
                    {
                        model: level_pengguna,
                        as: 'level_pengguna',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: user,
                        as: 'added_by_user',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: perusahaan,
                        as: 'asal_perusahaan',
                    },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all user successfully',
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: Math.ceil(count / limit),
                    currentPage: page,
                    pageSize: limit,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    generatePdf: async (req, res) => {
        try {
            const data = await user.findAll({
                include: [
                    {
                        model: user,
                        as: 'added_by_user',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: level_pengguna,
                        as: 'level_pengguna',
                        attributes: ['id', 'nama'],
                    },
                ],
            })

            const tableData = data.map((item, index) => {
                console.log(item)
                return {
                    no: index + 1,
                    nama: item.nama,
                    jenis_kelamin: item.jenis_kelamin,
                    no_hp: item.no_hp,
                    alamat_lengkap: item.alamat_lengkap,
                    level: item.level_pengguna?.nama || '-',
                    status: item.status,
                    created: dayjs(item.createdAt).format('DD-MM-YYYY'),
                    updated: dayjs(item.updatedAt).format('DD-MM-YYYY'),
                }
            })

            const template = fs.readFileSync(
                'src/templates/master-data/data-member.template.html',
                'utf-8'
            )
            const rowsHtml = generateTableRows(tableData)
            const finalHtml = template.replace('{{rows}}', rowsHtml)

            const browser = await puppeteer.launch()
            const page = await browser.newPage()
            await page.setContent(finalHtml, { waitUntil: 'networkidle0' })

            const pdfBuffer = await page.pdf({
                format: 'A4',
                printBackground: true,
            })

            await browser.close()

            res.set({
                'Content-Type': 'application/pdf',
                'Content-Disposition': 'inline; filename="report.pdf"',
                'Content-Length': pdfBuffer.length,
            })

            res.send(pdfBuffer)
        } catch (err) {
            console.error(err)
            res.status(500).send('Error generating PDF')
        }
    },
    create: async (req, res) => {
        try {
            const { username, password } = req.body
            const checkUsername = await user.findOne({
                where: {
                    username: username,
                },
            })
            if (checkUsername) {
                throw Error('auth_duplicate_username')
            }

            const hashedPassword = await argon.hash(password)

            const data = {
                ...req.body,
                password: hashedPassword,
            }

            const users = await user.create(data)

            return res.json({
                success: true,
                message: 'Create user successfully',
                results: { data: users },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await user.findAll({
                include: [
                    {
                        model: level_pengguna,
                        as: 'level_pengguna',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: user,
                        as: 'added_by_user',
                        attributes: ['id', 'nama'],
                    },
                ],
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get user successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const { password } = req.body

            let data = {}

            if (password) {
                const hashedPassword = await argon.hash(password)
                data = { ...req.body, password: hashedPassword }
            } else {
                data = { ...req.body }
            }

            const users = await user.update(
                { ...data },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )

            return res.json({
                success: true,
                message: 'Update user successfully',
                results: { data: users },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await user.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete user successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
