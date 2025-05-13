const errorhandler = require('../../helpers/errorhandler.helper')
const { permasalahan_atau_perbaikan, pos } = require('../../models/index')

module.exports = {
    getAll: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } =
                await permasalahan_atau_perbaikan.findAndCountAll({
                    include: [
                        {
                            model: pos,
                            as: 'pos',
                        },
                    ],
                    order: [[sortBy, sortOrder]],
                    offset: offset,
                    limit: limit,
                })
            return res.json({
                success: true,
                message: 'Get all permasalahan atau perbaikan successfully',
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
            const data = await permasalahan_atau_perbaikan.create(req.body)
            return res.json({
                success: true,
                message: 'Create permasalahan atau perbaikan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await permasalahan_atau_perbaikan.findAll({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get permasalahan atau perbaikan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await permasalahan_atau_perbaikan.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update permasalahan atau perbaikan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await permasalahan_atau_perbaikan.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete permasalahan atau perbaikan successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
