const transaksiRouter = require('express').Router()
const transaksiController = require('../../controllers/transaksi/transaksi.controller')
const transaksiTipeManualController = require('../../controllers/transaksi/transaksiTipeManual.controller')

// Routes utama
transaksiRouter.get('/', transaksiController.getAll)
transaksiRouter.get('/:id', transaksiController.findOneById)
transaksiRouter.post('/', transaksiController.create)
transaksiRouter.patch('/cancel-transaksi', transaksiController.cancelTransaksi)
transaksiRouter.patch('/:id', transaksiController.update)
transaksiRouter.delete('/:id', transaksiController.delete)

// ✅ Route baru untuk riwayat manual
transaksiRouter.get(
  '/manual/history',
  transaksiTipeManualController.getAllRiwayatTransaksiManual
)

module.exports = transaksiRouter
