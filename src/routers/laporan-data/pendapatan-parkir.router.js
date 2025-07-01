const pendapatanParkirRouter = require('express').Router()
const pendapatanParkirController = require('../../controllers/laporan-data/pendapatan-parkir.controller')

pendapatanParkirRouter.get(
    '/',
    pendapatanParkirController.getAllDataKendaraanIn
)
pendapatanParkirRouter.get(
    '/:id',
    pendapatanParkirController.getAllDataKendaraanOut
)

module.exports = pendapatanParkirRouter
