const errorhandler = require('../../helpers/errorhandler.helper')
const {
    laporan_data_audit_transaksi_kendaraan_keluar,
    laporan_data_audit_transaksi_manual,
    laporan_data_audit_transaksi_pembatalan_transaksi,
    laporan_data_audit_transaksi_penggunaan_voucher,
} = require('../../models/index')

module.exports = {
    getAllAuditTransaksiKendaraanKeluar: async (req, res) => {
        try {
            const search = req.query.search || ''
            const limit = req.query.limit ? parseInt(req.query.limit) : null
            const page = req.query.page ? parseInt(req.query.page) : null
            const offset = page && limit ? (page - 1) * limit : null
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'

            const options = {
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[sortBy, sortOrder]],
            }

            if (limit !== null && offset !== null) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } =
                await laporan_data_audit_transaksi_kendaraan_keluar.findAndCountAll(
                    options
                )

            return res.json({
                success: true,
                message:
                    'Get all audit transaksi kendaraan keluar successfully',
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: limit ? Math.ceil(count / limit) : 1,
                    currentPage: page || 1,
                    pageSize: limit || count,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllAuditTransaksiManual: async (req, res) => {
        try {
            const search = req.query.search || ''
            const limit = req.query.limit ? parseInt(req.query.limit) : null
            const page = req.query.page ? parseInt(req.query.page) : null
            const offset = page && limit ? (page - 1) * limit : null
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'

            const options = {
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[sortBy, sortOrder]],
            }

            if (limit !== null && offset !== null) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } =
                await laporan_data_audit_transaksi_manual.findAndCountAll(
                    options
                )

            return res.json({
                success: true,
                message: 'Get all audit transaksi manual successfully',
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: limit ? Math.ceil(count / limit) : 1,
                    currentPage: page || 1,
                    pageSize: limit || count,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllAuditTransaksiPenggunaanVoucher: async (req, res) => {
        try {
            const search = req.query.search || ''
            const limit = req.query.limit ? parseInt(req.query.limit) : null
            const page = req.query.page ? parseInt(req.query.page) : null
            const offset = page && limit ? (page - 1) * limit : null
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'

            const options = {
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[sortBy, sortOrder]],
            }

            if (limit !== null && offset !== null) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } =
                await laporan_data_audit_transaksi_penggunaan_voucher.findAndCountAll(
                    options
                )

            return res.json({
                success: true,
                message:
                    'Get all audit transaksi penggunaan voucher successfully',
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: limit ? Math.ceil(count / limit) : 1,
                    currentPage: page || 1,
                    pageSize: limit || count,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllAuditPembatalanTransaksi: async (req, res) => {
        try {
            const search = req.query.search || ''
            const limit = req.query.limit ? parseInt(req.query.limit) : null
            const page = req.query.page ? parseInt(req.query.page) : null
            const offset = page && limit ? (page - 1) * limit : null
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'

            const options = {
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[sortBy, sortOrder]],
            }

            if (limit !== null && offset !== null) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } =
                await laporan_data_audit_transaksi_pembatalan_transaksi.findAndCountAll(
                    options
                )

            return res.json({
                success: true,
                message: 'Get all audit pembatalan transaksi successfully',
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: Math.ceil(count / limit),
                    currentPage: page,
                    pageSize: limit,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
