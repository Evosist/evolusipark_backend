const settlementCashlessRouter = require('express').Router()
const settlementCashlessController = require('../../controllers/laporan-data/settlement-cashless.controller')

settlementCashlessRouter.get(
    '/',
    settlementCashlessController.getAllDataKendaraanIn
)
settlementCashlessRouter.get(
    '/:id',
    settlementCashlessController.getAllDataKendaraanOut
)

module.exports = settlementCashlessRouter
