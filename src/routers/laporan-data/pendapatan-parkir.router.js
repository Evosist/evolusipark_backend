const pendapatanParkirRouter = require('express').Router()
const pendapatanParkirController = require('../../controllers/laporan-data/pendapatan-parkir.controller')

pendapatanParkirRouter.get('/', pendapatanParkirController.pendapatanDariCasual)
pendapatanParkirRouter.get(
    '/:id',
    pendapatanParkirController.pendapatanDariMember
)

module.exports = pendapatanParkirRouter
