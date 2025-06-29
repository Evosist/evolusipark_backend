const settlementCashlessRouter = require('express').Router()
const settlementCashlessController = require('../../controllers/dashboard/aktivitas-gerbang-kendaraan.controller')

settlementCashlessRouter.get('/', settlementCashlessController.getAll)
settlementCashlessRouter.get('/:id', settlementCashlessController.findOneById)
settlementCashlessRouter.post('/', settlementCashlessController.create)
settlementCashlessRouter.patch('/:id', settlementCashlessController.update)
settlementCashlessRouter.delete('/:id', settlementCashlessController.delete)

module.exports = settlementCashlessRouter
