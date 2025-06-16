const router = require('express').Router()
const transaksiManualRouter = require('./transaksi-manual.router')
const transaksiTunaiRouter = require('./transaksi-tunai.router')
const permasalahanAtauPerbaikanRouter = require('./permasalahan-atau-perbaikan.router')

router.use('/manual', transaksiManualRouter)
router.use('/tunai', transaksiTunaiRouter)
router.use('/permasalahan-atau-perbaikan', permasalahanAtauPerbaikanRouter)

module.exports = router
