const tarifParkirRouter = require('express').Router()
const tarifParkirController = require('../../controllers/setting/tarifparkir.controller')

tarifParkirRouter.get('/', tarifParkirController.getAll)
tarifParkirRouter.get('/:id', tarifParkirController.findOneById)
tarifParkirRouter.post('/', tarifParkirController.create)
tarifParkirRouter.patch('/:id', tarifParkirController.update)
tarifParkirRouter.delete('/:id', tarifParkirController.delete)

module.exports = tarifParkirRouter
