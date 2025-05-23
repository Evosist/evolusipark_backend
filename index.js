require('dotenv').config({
    path: '.env',
})

const express = require('express')
const puppeteer = require('puppeteer')
const { format } = require('@fast-csv/format')
const fs = require('fs')
const app = express()

const data = [
    {
        id: 1,
        name: 'John Doe',
        email: 'john@example.com',
        created_at: '2025-05-01',
    },
    {
        id: 2,
        name: 'Jane Smith',
        email: 'jane@example.com',
        created_at: '2025-04-28',
    },
]

const tableData = [
    {
        no: 1,
        nama: 'Foto Pintu Masuk',
        nilai: '\\\\192.168.1.100\\photos',
        keterangan: 'Lokasi foto untuk pintu masuk',
        updated: 'Muhtar Lubis Asyari 18-11-2021 21:39',
    },
    {
        no: 2,
        nama: 'Foto Pintu Keluar',
        nilai: '\\\\192.168.1.100\\photos',
        keterangan: 'Lokasi foto untuk pintu keluar',
        updated: 'Muhtar Lubis Asyari 18-11-2021 21:39',
    },
    // Add more entries as needed...
]

// Utility to fill the HTML template
function generateTableRows(data) {
    return data
        .map(
            (item) => `
    <tr>
      <td>${item.no}</td>
      <td>${item.nama}</td>
      <td>${item.nilai}</td>
      <td>${item.keterangan}</td>
      <td>${item.updated}</td>
    </tr>
  `
        )
        .join('')
}

app.get('/generate-pdf', async (req, res) => {
    try {
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
})

app.get('/export-csv', (req, res) => {
    res.setHeader('Content-Disposition', 'attachment; filename="users.csv"')
    res.setHeader('Content-Type', 'text/csv')

    const csvStream = format({ headers: true })
    csvStream.pipe(res)

    data.forEach((row) => csvStream.write(row))
    csvStream.end()
})

app.use(express.json({ limit: '10mb', extended: true }))
app.use(
    express.urlencoded({ limit: '10mb', extended: true, parameterLimit: 50000 })
)
const PORT = process.env.PORT || 4000

const cors = require('cors')

app.use(
    cors({
        origin: '*',
        optionsSuccessStatus: 200,
    })
)

app.get('/', (req, res) => {
    return res.json({
        success: true,
        message: 'Backend is running well',
    })
})

app.use('/', require('./src/routers/index.router'))

app.listen(PORT, () => {
    console.log(`App is listening on port ${PORT}`)
})
