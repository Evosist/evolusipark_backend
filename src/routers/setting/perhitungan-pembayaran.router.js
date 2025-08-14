const perhitunganPembayaranRouter = require('express').Router()
const perhitunganPembayaranController = require('../../controllers/setting/perhitungan-pembayaran.controller')

perhitunganPembayaranRouter.get('/', perhitunganPembayaranController.getAll)
perhitunganPembayaranRouter.get(
    '/:id',
    perhitunganPembayaranController.findOneById
)
perhitunganPembayaranRouter.post('/', perhitunganPembayaranController.create)
perhitunganPembayaranRouter.patch(
    '/:id',
    perhitunganPembayaranController.update
)
perhitunganPembayaranRouter.delete(
    '/:id',
    perhitunganPembayaranController.delete
)

module.exports = perhitunganPembayaranRouter
