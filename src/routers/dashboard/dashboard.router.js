const dashboardRouter = require('express').Router()
const dashboardController = require('../../controllers/dashboard/dashboard.controller')

dashboardRouter.get('/', dashboardController.getAll)
dashboardRouter.get('/:id', dashboardController.findOneById)
dashboardRouter.post('/', dashboardController.create)
dashboardRouter.patch('/:id', dashboardController.update)
dashboardRouter.delete('/:id', dashboardController.delete)

module.exports = dashboardRouter
