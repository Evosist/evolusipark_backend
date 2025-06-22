const errorhandler = require('../../helpers/errorhandler.helper')
const { level_pengguna, user, perusahaan } = require('../../models/index')

module.exports = {
    getAll: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await level_pengguna.findAndCountAll({
                include: [
                    { model: user, as: 'user', attributes: ['id', 'nama'] },
                    {
                        model: perusahaan,
                        as: 'perusahaan',
                    },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all level pengguna successfully',
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
            const data = await level_pengguna.create({
                ...req.body,
                hak_akses: JSON.parse(req.body.hak_akses),
            })
            return res.json({
                success: true,
                message: 'Create level pengguna successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await level_pengguna.findAll({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get level pengguna successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    updateNama: async (req, res) => {
        try {
            const data = await level_pengguna.update(
                { nama: req.body.nama, perusahaan_id: req.body.perusahaan_id },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )
            return res.json({
                success: true,
                message: 'Update nama level pengguna successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await level_pengguna.update(
                { ...req.body, hak_akses: JSON.parse(req.body.hak_akses) },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )
            return res.json({
                success: true,
                message: 'Update level pengguna successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await level_pengguna.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete level pengguna successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
