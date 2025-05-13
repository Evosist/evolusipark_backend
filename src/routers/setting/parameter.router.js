const parameterRouter = require('express').Router()
const parameterController = require('../../controllers/setting/parameter.controller')

parameterRouter.get('/', parameterController.getAll)
parameterRouter.get('/:id', parameterController.findOneById)
parameterRouter.post('/', parameterController.create)
parameterRouter.patch('/:id', parameterController.update)
parameterRouter.delete('/:id', parameterController.delete)

module.exports = parameterRouter
