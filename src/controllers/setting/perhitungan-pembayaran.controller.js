const errorhandler = require('../../helpers/errorhandler.helper')
const { jenis_perhitungan_pembayaran } = require('../../models/index')
const Op = require('sequelize').Op

module.exports = {
    getAll: async (req, res) => {
        try {
            const search = req.query.search || ''
            const limit = req.query.limit ? parseInt(req.query.limit) : 10
            const page = req.query.page ? parseInt(req.query.page) : 1
            const offset = limit && page ? (page - 1) * limit : 0
            const sortBy = req.query.sortBy || 'id'
            const sortOrder =
                req.query.sortOrder?.toUpperCase() === 'DESC' ? 'DESC' : 'ASC'

            const allowedSortColumns = ['id', 'nama', 'createdAt', 'updatedAt']
            const validSortBy = allowedSortColumns.includes(sortBy)
                ? sortBy
                : 'id'

            const options = {
                where: {},
                order: [[validSortBy, sortOrder]],
            }

            if (search) {
                options.where[Op.or] = [{ nama: { [Op.iLike]: `%${search}%` } }]
            }

            if (limit) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } =
                await jenis_perhitungan_pembayaran.findAndCountAll(options)

            return res.json({
                success: true,
                message: 'Get all jenis perhitungan pembayaran successfully',
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: limit ? Math.ceil(count / limit) : 1,
                    currentPage: page,
                    pageSize: limit || count,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    create: async (req, res) => {
        try {
            const data = await jenis_perhitungan_pembayaran.create(req.body)
            return res.json({
                success: true,
                message: 'Create jenis perhitungan pembayaran successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await jenis_perhitungan_pembayaran.findAll({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get jenis perhitungan pembayaran successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await jenis_perhitungan_pembayaran.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update jenis perhitungan pembayaran successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await jenis_perhitungan_pembayaran.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete jenis perhitungan pembayaran successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
