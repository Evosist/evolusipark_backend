const kendaraanRouter = require('express').Router()
const kendaraanController = require('../../controllers/dashboard/aktivitas-gerbang-kendaraan.controller')

kendaraanRouter.get('/', kendaraanController.getAll)
kendaraanRouter.get('/:id', kendaraanController.findOneById)
kendaraanRouter.post('/', kendaraanController.create)
kendaraanRouter.patch('/:id', kendaraanController.update)
kendaraanRouter.delete('/:id', kendaraanController.delete)

module.exports = kendaraanRouter
