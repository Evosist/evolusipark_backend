const errorhandler = require('../../helpers/errorhandler.helper')
const {
    data_member,
    perusahaan,
    produk_member,
    data_nomor_polisi,
    riwayat_transaksi_member,
    riwayat_transaksi_kartu_member,
    riwayat_transaksi_ganti_nopol,
    tipe_kendaraan,
    user,
} = require('../../models/index')
const fs = require('fs')
const puppeteer = require('puppeteer')
const ExcelJS = require('exceljs')
const dayjs = require('dayjs')

// Utility to fill the HTML template
function generateTableRows(data) {
    return data
        .map(
            (item) => `
    <tr>
      <td>${item.no}</td>
      <td>${item.nama}</td>
      <td>${item.no_hp}</td>
      <td>${item.perusahaan.nama}</td>
      <td>${item.akses_tiket}</td>
      <td>${item.akses_kartu}</td>
      <td>${item.no_kartu}</td>
      <td>${item.tgl_input}</td>
      <td>${item.produk_member.nama}</td>
      <td>${item.tarif}</td>
      <td>${item.masa_aktif}</td>
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
            const { count, rows } = await data_member.findAndCountAll({
                include: [
                    { model: perusahaan, as: 'perusahaan' },
                    { model: produk_member, as: 'produk_member' },
                    { model: data_nomor_polisi, as: 'data_nomor_polisi' },
                    { model: user, as: 'user', attributes: ['id', 'nama'] },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all data member successfully',
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
            const data = await data_member.findAll({
                include: [
                    { model: perusahaan, as: 'perusahaan' },
                    { model: produk_member, as: 'produk_member' },
                    { model: data_nomor_polisi, as: 'data_nomor_polisi' },
                    { model: user, as: 'user', attributes: ['id', 'nama'] },
                ],
            })

            const tableData = data.map((item, index) => {
                const startDate = dayjs(item.periode?.[0]?.value)
                const endDate = dayjs(item.periode?.[1]?.value)
                const masa_aktif =
                    startDate.isValid() && endDate.isValid()
                        ? `${startDate.format('DD/MM/YYYY')} s/d ${endDate
                              .subtract(1, 'day')
                              .format('DD/MM/YYYY')}`
                        : '-'

                return {
                    no: index + 1,
                    nama: item.nama,
                    no_hp: item.no_hp,
                    perusahaan: item.perusahaan.nama,
                    akses_tiket: item.akses_tiket === true ? 'Ya' : 'Tidak',
                    akses_kartu: item.akses_kartu === true ? 'Ya' : 'Tidak',
                    no_kartu: item.no_kartu,
                    tgl_input: dayjs(item.tgl_input).format('DD/MM/YYYY'),
                    produk_member: item.produk_member.nama,
                    tarif: item.tarif,
                    masa_aktif, // otomatis dihitung dari periode
                    created: dayjs(item.createdAt).format('DD/MM/YYYY'),
                    updated: dayjs(item.updatedAt).format('DD/MM/YYYY'),
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
                path: 'data-member.pdf',
                format: 'A3', // atau coba 'A3' untuk lebih besar
                margin: {
                    top: '10mm',
                    bottom: '10mm',
                    left: '10mm',
                    right: '10mm',
                },
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
    generateExcel: async (req, res) => {
        try {
            const data = await kendaraan.findAll({
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: tipe_kendaraan,
                        as: 'tipe_kendaraan',
                    },
                ],
            })

            const workbook = new ExcelJS.Workbook()
            const worksheet = workbook.addWorksheet('Data Kendaraan')

            const dateStr = new Date().toLocaleDateString('id-ID', {
                day: '2-digit',
                month: 'long',
                year: 'numeric',
            })

            const headers = [
                'No.',
                'Nama',
                'Kontak',
                'Perusahaan',
                'Akses Tiket',
                'Akses Kartu',
                'Nomor Kartu',
                'Tgl Input',
                'Produk Member',
                'Tarif',
                'Masa Aktif',
                'Added',
            ]
            const lastColLetter = String.fromCharCode(65 + headers.length - 1) // Convert to Excel letter

            const mergeAndStyle = (value, font, rowIdx) => {
                worksheet.mergeCells(`A${rowIdx}:${lastColLetter}${rowIdx}`)
                const cellObj = worksheet.getCell(`A${rowIdx}`)
                cellObj.value = value
                cellObj.alignment = { horizontal: 'center' }
                cellObj.font = font
            }

            // === Judul Atas ===
            mergeAndStyle('Evolusi Park', { bold: true, size: 12 }, 1)
            mergeAndStyle(
                'Developed by PT. Evosist (Evolusi Sistem)',
                { italic: true, size: 10 },
                2
            )
            mergeAndStyle('Data Member', { bold: true, size: 20 }, 3)
            mergeAndStyle(dateStr, { size: 10 }, 4)

            worksheet.addRow([])

            // === Header Tabel ===
            const headerRow = worksheet.addRow(headers)
            headerRow.eachCell((cell) => {
                cell.fill = {
                    type: 'pattern',
                    pattern: 'solid',
                    fgColor: { argb: 'FFFF5B2A' },
                }
                cell.font = { bold: true, color: { argb: 'FFFFFFFF' } }
                cell.border = {
                    top: { style: 'thin' },
                    left: { style: 'thin' },
                    bottom: { style: 'thick' },
                    right: { style: 'thin' },
                }
                cell.alignment = { horizontal: 'center' }
            })

            // === Data Rows ===
            data.forEach((item, index) => {
                const row = worksheet.addRow([
                    index + 1,
                    item.nama,
                    item.no_hp,
                    item.perusahaan,
                    item.akses_tiket,
                    item.akses_kartu,
                    item.no_kartu,
                    item.tgl_input,
                    item.produk_member,
                    item.tarif,
                    item.masa_aktif,
                    new Date(item.createdAt).toLocaleString('id-ID'),
                ])

                row.eachCell((cell) => {
                    cell.border = {
                        top: { style: 'thin' },
                        left: { style: 'thin' },
                        bottom: { style: 'thin' },
                        right: { style: 'thin' },
                    }
                    cell.alignment = { vertical: 'middle' }
                })
            })

            // Auto-width kolom
            worksheet.columns.forEach((col) => {
                let maxLength = 10
                col.eachCell({ includeEmpty: true }, (cell) => {
                    if (cell.value) {
                        const length = cell.value.toString().length
                        if (length > maxLength) maxLength = length
                    }
                })
                col.width = maxLength + 2
            })

            // === Set header response and kirim Excel file ===
            res.setHeader(
                'Content-Type',
                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
            )
            res.setHeader(
                'Content-Disposition',
                'attachment; filename=DataKendaraan.xlsx'
            )
            await workbook.xlsx.write(res)
            res.end()
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    create: async (req, res) => {
        try {
            const data = await data_member.create(req.body)

            const nomorPolisiData = req.body.data_nomor_polisi.map((item) => ({
                ...item,
                data_member_id: data.id,
            }))

            await data_nomor_polisi.bulkCreate(nomorPolisiData)

            return res.json({
                success: true,
                message: 'Create data member successfully',
                results: { data, data_nomor_polisi: nomorPolisiData },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    perpanjangMasaAktif: async (req, res) => {
        try {
            // Ambil semua kendaraan_id milik member
            const kendaraanList = await data_nomor_polisi.findAll({
                where: { data_member_id: req.params.id },
                attributes: ['kendaraan_id'],
            })

            const memberKendaraanIds = kendaraanList.map((k) =>
                k.kendaraan_id.toString()
            )

            // Ambil produk_member baru yang akan digunakan
            const produk = await produk_member.findOne({
                where: { id: req.body.produk_id },
                attributes: ['list_id_kendaraan'],
            })

            if (!produk) {
                return res.status(404).json({
                    success: false,
                    message: 'Produk member tidak ditemukan',
                })
            }

            const listIdKendaraan = produk.list_id_kendaraan.map((id) =>
                id.toString()
            )

            // Cek apakah semua kendaraan member terdapat dalam list produk
            const kendaraanTidakTerdaftar = memberKendaraanIds.filter(
                (id) => !listIdKendaraan.includes(id)
            )

            if (kendaraanTidakTerdaftar.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: 'Kendaraan tidak sesuai dengan produk member',
                })
            }

            const data = await data_member.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })

            await riwayat_transaksi_member.create({
                tgl_transaksi: new Date(),
                produk_id: req.body.produk_id,
                tarif: req.body.tarif,
                masa_aktif: req.body.periode,
                user_id: req.body.user_id,
            })

            return res.json({
                success: true,
                message: 'Update data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    gantiNopol: async (req, res) => {
        try {
            // Cek apakah nomor polisi lama ada
            const data_nopol_lama = await data_nomor_polisi.findOne({
                where: {
                    nomor_polisi: req.body.nomor_polisi_lama,
                },
            })

            if (!data_nopol_lama) {
                return res.status(404).json({
                    success: false,
                    message: 'Nomor polisi lama tidak ditemukan',
                })
            }

            // Update nomor polisi
            const data = await data_nomor_polisi.update(
                {
                    nomor_polisi: req.body.nomor_polisi_baru,
                    kendaraan_id: req.body.kendaraan_id,
                },
                {
                    where: {
                        nomor_polisi: req.body.nomor_polisi_lama,
                    },
                }
            )

            // Cek data produk member
            const produkMemberData = await data_member.findOne({
                where: {
                    id: req.params.id,
                },
                include: [{ model: produk_member, as: 'produk_member' }],
            })

            if (!produkMemberData) {
                return res.status(404).json({
                    success: false,
                    message: 'Produk member tidak ditemukan',
                })
            }

            // Buat riwayat transaksi
            await riwayat_transaksi_ganti_nopol.create({
                tgl_transaksi: new Date(),
                nomor_polisi_lama: req.body.nomor_polisi_lama,
                nomor_polisi_baru: req.body.nomor_polisi_baru,
                tarif: produkMemberData?.produk_member?.tarif,
                keterangan: req.body.keterangan,
                user_id: req.body.user_id,
            })

            return res.json({
                success: true,
                message: 'Update data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    gantiKartu: async (req, res) => {
        try {
            const data = await data_member.update(
                {
                    no_kartu: req.body.no_kartu,
                },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )

            // Cek data member
            const dataMember = await data_member.findOne({
                where: {
                    id: req.params.id,
                },
                include: [{ model: produk_member, as: 'produk_member' }],
            })

            if (!dataMember) {
                return res.status(404).json({
                    success: false,
                    message: 'Data member tidak ditemukan',
                })
            }

            // Buat riwayat transaksi
            await riwayat_transaksi_kartu_member.create({
                tgl_transaksi: new Date(),
                no_kartu: req.body.no_kartu,
                tarif: dataMember?.produk_member?.tarif,
                keterangan: req.body.keterangan,
                user_id: req.body.user_id,
            })

            return res.json({
                success: true,
                message: 'Update data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await data_member.findAll({
                where: {
                    id: req.params.id,
                },
                include: [
                    { model: perusahaan, as: 'perusahaan' },
                    { model: produk_member, as: 'produk_member' },
                    { model: data_nomor_polisi, as: 'data_nomor_polisi' },
                    { model: user, as: 'user', attributes: ['id', 'nama'] },
                ],
            })
            return res.json({
                success: true,
                message: 'Get data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await data_member.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })

            const nomorPolisiData = req.body.data_nomor_polisi.map((item) => ({
                ...item,
                data_member_id: data.id,
            }))

            await data_nomor_polisi.bulkCreate(nomorPolisiData)

            return res.json({
                success: true,
                message: 'Create data member successfully',
                results: { data, data_nomor_polisi: nomorPolisiData },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await data_member.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
