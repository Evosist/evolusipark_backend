const router = require('express').Router()
const transaksiManualMixRouter = require('./transaksi-manual-mix.router')
const permasalahanAtauPerbaikanRouter = require('./permasalahan-atau-perbaikan.router')

router.use('/manual-mix', transaksiManualMixRouter)
router.use('/permasalahan-atau-perbaikan', permasalahanAtauPerbaikanRouter)

module.exports = router
