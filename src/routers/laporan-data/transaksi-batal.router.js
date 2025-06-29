const auditTransaksiRouter = require('express').Router()
const auditTransaksiController = require('../../controllers/dashboard/aktivitas-gerbang-kendaraan.controller')

auditTransaksiRouter.get('/', auditTransaksiController.getAll)
auditTransaksiRouter.get('/:id', auditTransaksiController.findOneById)
auditTransaksiRouter.post('/', auditTransaksiController.create)
auditTransaksiRouter.patch('/:id', auditTransaksiController.update)
auditTransaksiRouter.delete('/:id', auditTransaksiController.delete)

module.exports = auditTransaksiRouter
