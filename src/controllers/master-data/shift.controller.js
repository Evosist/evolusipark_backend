const errorhandler = require('../../helpers/errorhandler.helper')
const { shift, user } = require('../../models/index')

module.exports = {
    getAll: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await shift.findAndCountAll({
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all shift successfully',
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
            const data = await shift.create(req.body)
            return res.json({
                success: true,
                message: 'Create shift successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await shift.findAll({
                include: [
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get shift successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await shift.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update shift successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    updateStatus: async (req, res) => {
        try {
            const data = await shift.update(
                { status: false },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )
            return res.json({
                success: true,
                message: 'Update shift successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await shift.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete shift successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
