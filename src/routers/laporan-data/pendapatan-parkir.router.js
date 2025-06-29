const pendapatanParkirRouter = require('express').Router()
const pendapatanParkirController = require('../../controllers/dashboard/aktivitas-gerbang-kendaraan.controller')

pendapatanParkirRouter.get('/', pendapatanParkirController.getAll)
pendapatanParkirRouter.get('/:id', pendapatanParkirController.findOneById)
pendapatanParkirRouter.post('/', pendapatanParkirController.create)
pendapatanParkirRouter.patch('/:id', pendapatanParkirController.update)
pendapatanParkirRouter.delete('/:id', pendapatanParkirController.delete)

module.exports = pendapatanParkirRouter
