const transaksiRouter = require('express').Router()
const transaksiController = require('../../controllers/transaksi/transaksi.controller')
const transaksiTipeManualController = require('../../controllers/transaksi/transaksiTipeManual.controller')
const transaksiTipeTunaiController = require('../../controllers/transaksi/transaksiTipeTunai.controller')
const transaksiTipeBankController = require('../../controllers/transaksi/transaksiTipeBank.controller')
const transaksiTipeQrisController = require('../../controllers/transaksi/transaksiTipeQris.controller')
const transaksiTipeMemberController = require('../../controllers/transaksi/transaksiTipeMember.controller');

// ✅ Route baru untuk riwayat manual
transaksiRouter.get('/riwayat-manual', transaksiTipeManualController.getAllRiwayatTransaksiManual)
transaksiRouter.get('/riwayat-tunai', transaksiTipeTunaiController.getAllRiwayatTransaksiTunai)
transaksiRouter.get('/riwayat-bank', transaksiTipeBankController.getAllRiwayatTransaksiBank)
transaksiRouter.get('/riwayat-qris', transaksiTipeQrisController.getAllRiwayatTransaksiQris)
transaksiRouter.get('/riwayat-member', transaksiTipeMemberController.getAllRiwayatTransaksiMember);

// Routes utama
transaksiRouter.get('/', transaksiController.getAll)
transaksiRouter.get('/:id', transaksiController.findOneById)
transaksiRouter.post('/', transaksiController.create)
transaksiRouter.patch('/cancel-transaksi', transaksiController.cancelTransaksi)
transaksiRouter.patch('/:id', transaksiController.update)
transaksiRouter.delete('/:id', transaksiController.delete)


module.exports = transaksiRouter
