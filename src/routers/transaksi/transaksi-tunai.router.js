const transaksiTunaiRouter = require('express').Router()
const transaksiTunaiController = require('../../controllers/transaksi/transaksi-tunai.controller')

transaksiTunaiRouter.get('/', transaksiTunaiController.getAll)
transaksiTunaiRouter.get('/:id', transaksiTunaiController.findOneById)
transaksiTunaiRouter.post('/', transaksiTunaiController.create)
transaksiTunaiRouter.patch(
    '/cancel-transaksi',
    transaksiTunaiController.updateTransaksi
)
transaksiTunaiRouter.patch('/:id', transaksiTunaiController.update)
transaksiTunaiRouter.delete('/:id', transaksiTunaiController.delete)

module.exports = transaksiTunaiRouter
