const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAllPembatalanTransaksi: async (req, res) => {
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
                'no_tiket',
                'tanggal_masuk',
                'pintu_masuk_id',
                'tanggal_pembatalan',
                'alasan_pembatalan',
                'penjelasan_pembatalan',
                'user_id',
                'createdAt',
                'updatedAt',
            ]
            const validSortBy = allowedSortColumns.includes(sortBy)
                ? sortBy
                : 'id'

            const options = {
                where: {},
                include: [
                    {
                        model: pos,
                        as: 'pintu_masuk',
                        attributes: ['id', 'keterangan'],
                    },
                    {
                        model: user,
                        as: 'user',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[validSortBy, sortOrder]],
            }

            if (search) {
                const searchLower = search.toLowerCase()
                let statusFilter = null

                if (searchLower === 'true' || searchLower === '1') {
                    statusFilter = true
                } else if (searchLower === 'false' || searchLower === '0') {
                    statusFilter = false
                }

                options.where[Op.or] = [
                    literal(
                        `CAST("tanggal_masuk" AS TEXT) ILIKE '%${search}%'`
                    ),
                    {
                        '$pintu_masuk.keterangan$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    {
                        no_tiket: {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    {
                        alasan_pembatalan: {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    {
                        penjelasan_pembatalan: {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                ]
            }

            if (limit) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } =
                await laporan_transaksi_batal.findAndCountAll(options)

            return res.json({
                success: true,
                message: 'Get all laporan transaksi batal successfully',
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
}
