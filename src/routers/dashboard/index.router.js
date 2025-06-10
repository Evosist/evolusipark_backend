const router = require('express').Router()
const aktivitasGerbangKendaraan = require('./parameter.router')

router.use('/aktivitas-gerbang-kendaraan', aktivitasGerbangKendaraan)

module.exports = router
