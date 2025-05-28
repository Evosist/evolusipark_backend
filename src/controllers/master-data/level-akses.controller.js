const errorhandler = require('../../helpers/errorhandler.helper')
const { level_akses, user } = require('../../models/index')

module.exports = {
    getAll: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await level_akses.findAndCountAll({
                include: [
                    { model: user, as: 'user', attributes: ['id', 'nama'] },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all level akses successfully',
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
            const data = await level_akses.create({
                ...req.body,
                akses_menu: JSON.parse(req.body.akses_menu),
            })
            return res.json({
                success: true,
                message: 'Create level akses successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await level_akses.findAll({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get level akses successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await level_akses.update(
                { ...req.body, akses_menu: JSON.parse(req.body.akses_menu) },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )
            return res.json({
                success: true,
                message: 'Update level akses successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await level_akses.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete level akses successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
