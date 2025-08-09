// tenant.middleware.js
module.exports = (req, res, next) => {
    if (!req.user || !req.user.tenant_id) {
        return res.status(403).json({ message: 'Tenant ID tidak ditemukan' })
    }

    req.tenant_id = req.user.tenant_id

    // supaya ikut ke create()
    req.body.tenant_id = req.user.tenant_id

    next()
}
