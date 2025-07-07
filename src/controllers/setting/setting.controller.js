const errorhandler = require('../../helpers/errorhandler.helper')
const { setting } = require('../../models/index')

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

            const allowedSortColumns = [
                'id',
                'nama',
                'value',
                'createdAt',
                'updatedAt',
            ]
            const validSortBy = allowedSortColumns.includes(sortBy)
                ? sortBy
                : 'id'

            const options = {
                where: {},
                order: [[validSortBy, sortOrder]],
            }

            if (search) {
                options.where[Op.or] = [
                    { nama: { [Op.iLike]: `%${search}%` } },
                    { value: { [Op.iLike]: `%${search}%` } },
                ]
            }

            if (limit) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } = await setting.findAndCountAll(options)

            return res.json({
                success: true,
                message: 'Get all setting successfully',
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
            const data = await setting.create({
                ...req.body,
                data_nomor_polisi: JSON.parse(req.body.data_nomor_polisi),
            })
            return res.json({
                success: true,
                message: 'Create setting successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await setting.findAll({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get setting successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await setting.update(
                {
                    ...req.body,
                    data_nomor_polisi: JSON.parse(req.body.data_nomor_polisi),
                },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )
            return res.json({
                success: true,
                message: 'Update setting successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await setting.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete setting successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
