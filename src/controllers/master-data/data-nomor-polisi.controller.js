const errorhandler = require('../../helpers/errorhandler.helper')
const {
    data_nomor_polisi,
    kendaraan,
    data_member,
} = require('../../models/index')

module.exports = {
    getAll: async (req, res) => {
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
                        model: kendaraan,
                        as: 'kendaraan',
                    },
                    {
                        model: data_member,
                        as: 'data_member',
                    },
                ],
                order: [[sortBy, sortOrder]],
            }

            if (limit !== null && offset !== null) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } = await data_nomor_polisi.findAndCountAll(
                options
            )

            return res.json({
                success: true,
                message: 'Get all data nomor polisi successfully',
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
    create: async (req, res) => {
        try {
            const data = await data_nomor_polisi.create(req.body)
            return res.json({
                success: true,
                message: 'Create data nomor polisi successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await data_nomor_polisi.findAll({
                where: {
                    id: req.params.id,
                },
                include: [
                    {
                        model: kendaraan,
                        as: 'kendaraan',
                    },
                    {
                        model: data_member,
                        as: 'member',
                    },
                ],
            })
            return res.json({
                success: true,
                message: 'Get data nomor polisi successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await data_nomor_polisi.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update data nomor polisi successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await data_nomor_polisi.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete data nomor polisi successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
