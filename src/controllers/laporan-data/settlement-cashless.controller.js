const errorhandler = require('../../helpers/errorhandler.helper')
const {
    data_kendaraan_masuk,
    data_kendaraan_keluar,
} = require('../../models/index')

module.exports = {
    getAllDataKendaraanIn: async (req, res) => {
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

            const { count, rows } = await data_kendaraan_masuk.findAndCountAll(
                options
            )

            return res.json({
                success: true,
                message: 'Get all data kendaraan masuk successfully',
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
    getAllDataKendaraanOut: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await data_kendaraan_keluar.findAndCountAll(
                {
                    order: [[sortBy, sortOrder]],
                    offset: offset,
                    limit: limit,
                }
            )
            return res.json({
                success: true,
                message: 'Get all data kendaraan keluar successfully',
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
