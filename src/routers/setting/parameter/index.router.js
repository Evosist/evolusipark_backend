const router = require('express').Router()
const parameterRouter = require('./parameter.router')
const tipeKendaraanRouter = require('./tipe-kendaraan.router')

router.use('/parameter', parameterRouter)
router.use('/tipe-kendaraan', tipeKendaraanRouter)

module.exports = router
