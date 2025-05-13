const pembatalanTransaksiRouter = require('express').Router()
const pembatalanTransaksiController = require('../../controllers/transaksi/pembatalan-transaksi.controller')

pembatalanTransaksiRouter.get('/', pembatalanTransaksiController.getAll)
pembatalanTransaksiRouter.get('/:id', pembatalanTransaksiController.findOneById)
pembatalanTransaksiRouter.post('/', pembatalanTransaksiController.create)
pembatalanTransaksiRouter.patch('/:id', pembatalanTransaksiController.update)
pembatalanTransaksiRouter.delete('/:id', pembatalanTransaksiController.delete)

module.exports = pembatalanTransaksiRouter
