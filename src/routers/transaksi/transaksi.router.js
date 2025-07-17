const transaksiRouter = require('express').Router()
const transaksiController = require('../../controllers/transaksi/transaksi.controller')

transaksiRouter.get('/', transaksiController.getAll)
transaksiRouter.get('/:id', transaksiController.findOneById)
transaksiRouter.post('/', transaksiController.create)
transaksiRouter.patch('/cancel-transaksi', transaksiController.updateTransaksi)
transaksiRouter.patch('/:id', transaksiController.update)
transaksiRouter.delete('/:id', transaksiController.delete)

module.exports = transaksiRouter
