const router = require('express').Router()

router.use('/auth', require('./auth.router'))
router.use('/master-data', require('../routers/master-data/master-data.router'))
router.use('/setting', require('../routers/setting/setting.router'))
router.use('/transaksi', require('../routers/transaksi/transaksi.router'))

router.get('/', (req, res) => {
    return res.json({
        success: true,
        message: 'Backend is running well',
    })
})

module.exports = router
