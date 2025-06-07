const levelPenggunaRouter = require('express').Router()
const levelPenggunaController = require('../../controllers/master-data/level-pengguna.controller')

levelPenggunaRouter.get('/', levelPenggunaController.getAll)
levelPenggunaRouter.get('/:id', levelPenggunaController.findOneById)
levelPenggunaRouter.post('/', levelPenggunaController.create)
levelPenggunaRouter.patch('/:id', levelPenggunaController.update)
levelPenggunaRouter.delete('/:id', levelPenggunaController.delete)

module.exports = levelPenggunaRouter
