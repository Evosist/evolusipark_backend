const shiftRouter = require('express').Router()
const shiftController = require('../../controllers/master-data/shift.controller')

shiftRouter.get('/', shiftController.getAll)
shiftRouter.get('/:id', shiftController.findOneById)
shiftRouter.post('/', shiftController.create)
shiftRouter.patch('/:id', shiftController.update)
shiftRouter.patch('/status/:id', shiftController.updateStatus)
shiftRouter.delete('/:id', shiftController.delete)

module.exports = shiftRouter
