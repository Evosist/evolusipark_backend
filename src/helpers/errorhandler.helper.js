const { Sequelize } = require('sequelize')
const errorhandler = (res, err) => {
    console.log(err)
    if (err?.message?.includes('auth_duplicate_email')) {
        return res.status(409).json({
            success: false,
            message: 'auth_duplicate_email',
        })
    }

    if (
        err?.message?.includes('Duplicate key value violates unique constraint')
    ) {
        return res.status(409).json({
            success: false,
            message: 'error_duplicate_key',
        })
    }

    if (err?.message?.includes('fileformat_error')) {
        return res.status(400).json({
            success: false,
            message: 'Format file tidak sesuai',
        })
    }

    if (err?.message?.includes('empty_assets')) {
        return res.status(409).json({
            success: false,
            message: 'Aset sudah habis',
        })
    }

    if (err?.message?.includes('File too large')) {
        return res.status(413).json({
            success: false,
            message: 'File terlalu besar',
        })
    }

    if (err?.name === 'SequelizeForeignKeyConstraintError') {
        const errorDetail = err.original.detail
        if (errorDetail.includes(`area_id`)) {
            return res.status(500).json({
                success: false,
                message: 'Kode Area ada yang tidak valid',
            })
        } else if (errorDetail.includes(`branch_id`)) {
            return res.status(500).json({
                success: false,
                message: 'Kode Cabang ada yang tidak valid',
            })
        } else if (errorDetail.includes(`departement_id`)) {
            return res.status(500).json({
                success: false,
                message: 'Kode Divisi ada yang tidak valid',
            })
        } else if (errorDetail.includes(`level_id`)) {
            return res.status(500).json({
                success: false,
                message: 'Kode Level ada yang tidak valid',
            })
        } else if (errorDetail.includes(`position_id`)) {
            return res.status(500).json({
                success: false,
                message: 'Kode Jabatan ada yang tidak valid',
            })
        }
    }

    if (err instanceof Sequelize.UniqueConstraintError) {
        const fieldName =
            err.errors && err.errors.length > 0 ? err.errors[0].path : 'field'
        const value =
            err.errors && err.errors.length > 0 ? err.errors[0].value : 'value'
        const message = `${fieldName} sudah ada`

        return res.status(400).json({
            success: false,
            message: message,
        })
    }

    if (err?.message?.includes('unauthorized')) {
        return res.status(401).json({
            success: false,
            message: 'unauthorized',
        })
    }

    if (err?.message?.includes('no_forgot_request')) {
        return res.status(401).json({
            success: false,
            message: 'no_forgot_request',
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

    return res.status(500).json({
        success: false,
        message: 'Error: Internal server error',
    })
}

module.exports = errorhandler
