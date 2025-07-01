const auditTransaksiRouter = require('express').Router()
const auditTransaksiController = require('../../controllers//laporan-data/transaksi-batal.controller')

auditTransaksiRouter.get('/', auditTransaksiController.getAllDataKendaraanIn)
auditTransaksiRouter.get(
    '/:id',
    auditTransaksiController.getAllDataKendaraanOut
)

module.exports = auditTransaksiRouter
