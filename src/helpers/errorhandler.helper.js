const { Sequelize } = require('sequelize')
const errorhandler = (res, err) => {
    console.log(err)
    if (err?.message?.includes('unauthorized')) {
        return res.status(401).json({
            success: false,
            message: 'unauthorized',
        })
    }

    if (err?.message?.includes('auth_wrong_password')) {
        return res.status(400).json({
            success: false,
            message: 'auth_wrong_password',
        })
    }

    if (err?.message?.includes('auth_no_email')) {
        return res.status(404).json({
            success: false,
            message: 'auth_no_email',
        })
    }

    if (err?.message?.includes('auth_no_username')) {
        return res.status(404).json({
            success: false,
            message: 'auth_no_username',
        })
    }

    return res.status(500).json({
        success: false,
        message: 'Error: Internal server error',
    })
}

module.exports = errorhandler
