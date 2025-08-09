const router = require('express').Router()
const authMiddleware = require('../../src/middleware/auth.middleware')

router.use('/dashboard', authMiddleware, require('./dashboard/index.router'))
router.use('/auth', require('./auth.router'))
router.use(
    '/master-data',
    authMiddleware,
    require('../routers/master-data/master-data.router')
)
router.use(
    '/laporan-data',
    authMiddleware,
    require('../routers/laporan-data/index.router')
)
router.use(
    '/setting',
    authMiddleware,
    require('../routers/setting/setting.router')
)
router.use('/transaksi', authMiddleware, require('./transaksi/index.router'))
router.use(
    '/profile',
    authMiddleware,
    require('../routers/profile/profile.router')
)
router.use('/tenant', require('../routers/tenant/tenant.router'))

router.get('/', (req, res) => {
    return res.json({
        success: true,
        message: 'Backend is running well',
    })
})

module.exports = router
