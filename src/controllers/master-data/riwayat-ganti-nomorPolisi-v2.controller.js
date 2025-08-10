const { riwayat_ganti_nomor_polisi_v2, data_member, user } = require('../../models')
const errorhandler = require('../../helpers/errorhandler.helper')
const { Op } = require('sequelize')


module.exports = {
    // GET riwayat ganti nomor polisi by data_member_id dengan pagination dan search
    getRiwayatByMemberId: async (req, res) => {
        try {
            const memberId = parseInt(req.params.memberId)
            if (!memberId) {
                return res
                    .status(400)
                    .json({ success: false, message: 'Member ID is required' })
            }

            const search = req.query.search || ''
            const limit = req.query.limit ? parseInt(req.query.limit) : 10
            const page = req.query.page ? parseInt(req.query.page) : 1
            const offset = (page - 1) * limit

            const whereClause = {
                data_member_id: memberId,
            }

            if (search) {
                whereClause[Op.or] = [
                    { nomor_polisi_lama: { [Op.iLike]: `%${search}%` } },
                    { nomor_polisi_baru: { [Op.iLike]: `%${search}%` } },
                    { keterangan: { [Op.iLike]: `%${search}%` } },
                ]
            }

            const { count, rows } =
                await riwayat_ganti_nomor_polisi_v2.findAndCountAll({
                    where: whereClause,
                    include: [
                        {
                            model: data_member,
                            as: 'data_member',
                            attributes: ['id', 'nama', 'no_kartu'],
                            include: [
                                {
                                    model: user,
                                    as: 'user',
                                    attributes: ['nama'], // ini nama user dari member
                                },
                            ],
                        },
                        // {
                        //     model: produk_member,
                        //     as: 'produk_member',
                        //     attributes: ['nama'], // nama produk
                        // },
                    ],
                    order: [['tgl_ganti', 'DESC']],
                    limit,
                    offset,
                })

            return res.json({
                success: true,
                message: `Riwayat ganti nomor polisi member id ${memberId}`,
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: Math.ceil(count / limit),
                    currentPage: page,
                    pageSize: limit,
                },
            })
        } catch (error) {
            console.error('Error getRiwayatByMemberId:', error)
            return errorhandler(res, error)
        }
    },

    createRiwayat: async (req, res) => {
        try {
            const {
                data_member_id,
                nomor_polisi_lama,
                nomor_polisi_baru,
                keterangan,
                user_id,
            } = req.body

            if (
                !data_member_id ||
                !nomor_polisi_lama ||
                !nomor_polisi_baru ||
                !user_id
            ) {
                return res.status(400).json({
                    success: false,
                    message: 'Missing required fields',
                })
            }

            // 1️⃣ Cek apakah nomor polisi baru sudah pernah digunakan oleh member ini
            const existingNopol = await riwayat_ganti_nomor_polisi_v2.findOne({
                where: {
                    data_member_id,
                    [Op.or]: [
                        {
                            nomor_polisi_lama: {
                                [Op.iLike]: nomor_polisi_baru,
                            },
                        },
                        {
                            nomor_polisi_baru: {
                                [Op.iLike]: nomor_polisi_baru,
                            },
                        },
                    ],
                },
            })

            if (existingNopol) {
                return res.status(400).json({
                    success: false,
                    message: `Nomor polisi "${nomor_polisi_baru}" sudah pernah digunakan sebelumnya`,
                })
            }

            // 2️⃣ Insert data baru
            const newData = await riwayat_ganti_nomor_polisi_v2.create({
                data_member_id,
                nomor_polisi_lama,
                nomor_polisi_baru,
                keterangan,
                user_id,
                tgl_ganti: new Date(),
            })

            return res.status(201).json({
                success: true,
                message: 'Riwayat ganti nomor polisi berhasil dibuat',
                results: newData,
            })
        } catch (error) {
            console.error('Error createRiwayat:', error)
            return errorhandler(res, error)
        }
    },
}
