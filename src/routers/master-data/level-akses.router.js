const levelAksesRouter = require('express').Router()
const levelAksesController = require('../../controllers/master-data/level-akses.controller')

levelAksesRouter.get('/', levelAksesController.getAll)
levelAksesRouter.get('/:id', levelAksesController.findOneById)
levelAksesRouter.post('/', levelAksesController.create)
levelAksesRouter.patch('/:id', levelAksesController.update)
levelAksesRouter.delete('/:id', levelAksesController.delete)

module.exports = levelAksesRouter
