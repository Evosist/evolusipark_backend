const errorhandler = require('../../helpers/errorhandler.helper')
const { user, level_pengguna, perusahaan } = require('../../models/index')
const argon = require('argon2')
const jwt = require('jsonwebtoken')

module.exports = {
    getAll: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await user.findAndCountAll({
                include: [
                    {
                        model: level_pengguna,
                        as: 'level_pengguna',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: user,
                        as: 'added_by_user',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: perusahaan,
                        as: 'asal_perusahaan',
                    },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all user successfully',
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
            const { username, password } = req.body
            const checkUsername = await user.findOne({
                where: {
                    username: username,
                },
            })
            if (checkUsername) {
                throw Error('auth_duplicate_username')
            }

            const hashedPassword = await argon.hash(password)

            const data = {
                ...req.body,
                password: hashedPassword,
            }

            const users = await user.create(data)

            return res.json({
                success: true,
                message: 'Create user successfully',
                results: { data: users },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await user.findAll({
                include: [
                    {
                        model: level_pengguna,
                        as: 'level_pengguna',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: user,
                        as: 'added_by_user',
                        attributes: ['id', 'nama'],
                    },
                ],
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get user successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const { password } = req.body

            let data = {}

            if (password) {
                const hashedPassword = await argon.hash(password)
                data = { ...req.body, password: hashedPassword }
            } else {
                data = { ...req.body }
            }

            const users = await user.update(
                { ...data },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )

            return res.json({
                success: true,
                message: 'Update user successfully',
                results: { data: users },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await user.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete user successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
