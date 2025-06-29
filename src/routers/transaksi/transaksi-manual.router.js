const transaksiManualRouter = require('express').Router()
const transaksiManualMixController = require('../../controllers/transaksi/transaksi-manual.controller')

transaksiManualRouter.get('/', transaksiManualMixController.getAll)
transaksiManualRouter.get('/:id', transaksiManualMixController.findOneById)
transaksiManualRouter.post('/', transaksiManualMixController.create)
transaksiManualRouter.post(
    '/laporan',
    transaksiManualMixController.createLaporan
)
transaksiManualRouter.patch(
    '/cancel-transaksi',
    transaksiManualMixController.updateTransaksi
)
transaksiManualRouter.patch('/:id', transaksiManualMixController.update)
transaksiManualRouter.delete('/:id', transaksiManualMixController.delete)

module.exports = transaksiManualRouter
