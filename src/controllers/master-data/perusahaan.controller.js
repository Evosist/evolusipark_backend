const dayjs = require('dayjs')
const errorhandler = require('../../helpers/errorhandler.helper')
const { perusahaan, user } = require('../../models/index')
const fs = require('fs')
const puppeteer = require('puppeteer')

// Utility to fill the HTML template
function generateTableRows(data) {
    return data
        .map(
            (item) => `
    <tr>
      <td>${item.no}</td>
      <td>${item.nama}</td>
      <td>${item.jenis_perusahaan}</td>
      <td>${item.kontak}</td>
      <td>${item.status}</td>
      <td>${item.createdAt}</td>
      <td>${item.updatedAt}</td>
    </tr>
  `
        )
        .join('')
}

module.exports = {
    getAll: async (req, res) => {
        try {
            const search = req.query.search || ''
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await perusahaan.findAndCountAll({
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all perusahaan successfully',
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
    create: async (req, res) => {
        try {
            const data = await perusahaan.create(req.body)
            return res.json({
                success: true,
                message: 'Create perusahaan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    generatePdf: async (req, res) => {
       try {
               const data = await perusahaan.findAll({
                   include: [
                       {
                           model: user,
                           as: 'user',
                           attributes: ['id', 'nama'],
                       },
                   ],
               })


               const tableData = data.map((item, index) => ({
                   no: index + 1,
                   nama: item.nama,
                   jenis_perusahaan: item.jenis_perusahaan,
                   kontak: item.kontak,
                   status: item.status,
                   createdAt: dayjs(item.createdAt).format('DD-MM-YYYY'),
                   updatedAt: dayjs(item.updatedAt).format('DD-MM-YYYY'),
               }))

               const template = fs.readFileSync('template.html', 'utf-8')
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
    findOneById: async (req, res) => {
        try {
            const data = await perusahaan.findAll({
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get perusahaan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await perusahaan.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update perusahaan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    updateStatus: async (req, res) => {
        try {
            const data = await perusahaan.update(
                { status: req.body.status },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )
            return res.json({
                success: true,
                message: 'Update perusahaan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await perusahaan.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete perusahaan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
