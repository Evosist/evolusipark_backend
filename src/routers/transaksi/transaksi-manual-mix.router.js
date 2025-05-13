const transaksiManualMixRouter = require('express').Router()
const transaksiManualMixController = require('../../controllers/transaksi/transaksi-manual-mix.controller')

transaksiManualMixRouter.get('/', transaksiManualMixController.getAll)
transaksiManualMixRouter.get('/:id', transaksiManualMixController.findOneById)
transaksiManualMixRouter.post('/', transaksiManualMixController.create)
transaksiManualMixRouter.patch(
    '/cancel-transaksi',
    transaksiManualMixController.updateTransaksi
)
transaksiManualMixRouter.patch('/:id', transaksiManualMixController.update)
transaksiManualMixRouter.delete('/:id', transaksiManualMixController.delete)

module.exports = transaksiManualMixRouter
