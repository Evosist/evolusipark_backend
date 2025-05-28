const profileRouter = require('express').Router()
const profileController = require('../../controllers/setting/global.controller')

profileRouter.get('/', profileController.getAll)
profileRouter.get('/:id', profileController.findOneById)
profileRouter.post('/', profileController.create)
profileRouter.patch('/:id', profileController.update)
profileRouter.delete('/:id', profileController.delete)

module.exports = profileRouter
