const router = require('express').Router()
const transaksiManualMixRouter = require('./transaksi-manual-mix.router')
const pembatalanTransaksiRouter = require('./pembatalan-transaksi.router')
const permasalahanAtauPerbaikanRouter = require('./permasalahan-atau-perbaikan.router')

router.use('/manual-mix', transaksiManualMixRouter)
router.use('/pembatalan-transaksi', pembatalanTransaksiRouter)
router.use('/permasalahan-atau-perbaikan', permasalahanAtauPerbaikanRouter)

module.exports = router
