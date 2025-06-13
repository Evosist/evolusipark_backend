const router = require('express').Router()
const aktivitasGerbangKendaraan = require('./aktivitas-gerbang-kendaraan.router')

router.use('/aktivitas-gerbang-kendaraan', aktivitasGerbangKendaraan)

module.exports = router
