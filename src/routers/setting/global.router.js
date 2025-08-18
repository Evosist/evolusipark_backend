const globalRouter = require('express').Router()
const globalController = require('../../controllers/setting/global.controller')
const uploadLogo = require('../../helpers/uploadLogo.helper')
const authMiddleware = require('../../middleware/auth.middleware')
const tenantMiddleware = require('../../middleware/tenant.middleware')

globalRouter.patch(
    '/logo',
    authMiddleware,
    tenantMiddleware,
    (req, res, next) => {
        uploadLogo(req, res, (err) => {
            console.log('Hit PATCH /logo')
            if (err) {
                return res
                    .status(400)
                    .json({ success: false, message: err.message })
            }
            next()
        })
    },
    globalController.uploadLogo
)
globalRouter.get('/', globalController.getAll)
globalRouter.get('/pdf', globalController.generatePdf)
globalRouter.get('/excel', globalController.generateExcel)
globalRouter.get('/:id', globalController.findOneById)
globalRouter.post('/', globalController.create)
globalRouter.patch('/:id', globalController.update)
globalRouter.delete('/:id', globalController.delete)

module.exports = globalRouter
