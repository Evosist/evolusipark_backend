const router = require('express').Router()
const aktivitasGerbangKendaraan = require('./aktivitas-gerbang-kendaraan.router')
const grafikRouter = require('./grafik.router')

router.use('/aktivitas-gerbang-kendaraan', aktivitasGerbangKendaraan)
router.use('/grafik', grafikRouter)

module.exports = router
