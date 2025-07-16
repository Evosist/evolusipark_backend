const router = require('express').Router()
const transaksiRouter = require('./transaksi.router')
const permasalahanAtauPerbaikanRouter = require('./permasalahan-atau-perbaikan.router')

router.use('/', transaksiRouter)
router.use('/permasalahan-atau-perbaikan', permasalahanAtauPerbaikanRouter)

module.exports = router
