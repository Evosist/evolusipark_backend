const errorhandler = require('../../helpers/errorhandler.helper')
const {
    transaksi_tunai,
    pos,
    kendaraan,
    user,
    shift,
    tarif_parkir,
    tarif_denda,
} = require('../../models/index')
const dayjs = require('dayjs')
const relativeTime = require('dayjs/plugin/relativeTime')

dayjs.extend(relativeTime)

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
                'nopol',
                'nomor_kartu',
                'waktu_masuk',
                'waktu_keluar',
                'biaya',
                'denda',
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
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: pos,
                        as: 'pintu_keluar',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: kendaraan,
                        as: 'kendaraan',
                        attributes: ['id', 'nopol', 'tipe_kendaraan_id'],
                        include: [
                            {
                                model: tipe_kendaraan,
                                as: 'tipe_kendaraan',
                                attributes: ['id', 'tipe_kendaraan'],
                            },
                        ],
                    },
                    {
                        model: shift,
                        as: 'shift',
                        attributes: ['id', 'nama', 'jam_masuk', 'jam_keluar'],
                    },
                    {
                        model: user,
                        as: 'petugas',
                        attributes: ['id', 'nama'],
                    },
                ],
                order: [[validSortBy, sortOrder]],
            }

            if (search) {
                options.where[Op.or] = [
                    { nopol: { [Op.iLike]: `%${search}%` } },
                    { nomor_kartu: { [Op.iLike]: `%${search}%` } },
                    { '$pintu_masuk.nama$': { [Op.iLike]: `%${search}%` } },
                    { '$pintu_keluar.nama$': { [Op.iLike]: `%${search}%` } },
                    { '$kendaraan.nopol$': { [Op.iLike]: `%${search}%` } },
                    {
                        '$kendaraan.tipe_kendaraan.tipe_kendaraan$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    { '$shift.nama$': { [Op.iLike]: `%${search}%` } },
                    { '$petugas.nama$': { [Op.iLike]: `%${search}%` } },
                ]
            }

            if (limit) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } = await transaksi_tunai.findAndCountAll(
                options
            )

            return res.json({
                success: true,
                message: 'Get all transaksi tunai successfully',
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
            const dataTarifParkir = await tarif_parkir.findOne({
                where: {
                    kendaraan_id: req.body.kendaraan_id,
                },
            })

            const dataTarifDenda = await tarif_denda.findOne({
                where: {
                    kendaraan_id: req.body.kendaraan_id,
                },
            })

            if (!dataTarifDenda) {
                return res.status(404).json({
                    success: false,
                    message: 'Tarif denda tidak ditemukan',
                })
            }

            if (!dataTarifParkir) {
                return res.status(404).json({
                    success: false,
                    message: 'Tarif parkir tidak ditemukan',
                })
            }

            const waktu_masuk = dayjs(req.body.tanggal_masuk).format(
                'YYYY-MM-DD HH:mm:ss'
            )
            const waktu_keluar = dayjs(req.body.tanggal_keluar).format(
                'YYYY-MM-DD HH:mm:ss'
            )

            if (!waktu_masuk || !waktu_keluar) {
                return res
                    .status(400)
                    .json({ error: 'Waktu Masuk dan Waktu Keluar wajib diisi' })
            }

            const masuk = new Date(waktu_masuk)
            const keluar = new Date(waktu_keluar)

            if (keluar < masuk) {
                return res.status(400).json({
                    error: 'waktu_keluar tidak boleh lebih awal dari waktu_masuk',
                })
            }

            const selisihMs = keluar - masuk
            const selisihJam = Math.ceil(selisihMs / (1000 * 60 * 60))

            // Pastikan tarif adalah angka
            const tarifPertama = dataTarifParkir.tarif_rotasi_pertama || 0
            const tarifKedua = dataTarifParkir.tarif_rotasi_kedua || 0
            const tarifKetiga = dataTarifParkir.tarif_rotasi_ketiga || 0

            let biaya = 0

            if (selisihJam >= 1) biaya += tarifPertama
            if (selisihJam >= 2) biaya += tarifKedua
            if (selisihJam >= 3) biaya += (selisihJam - 2) * tarifKetiga

            let biayaDendaTiket = 0
            let biayaDendaStnk = 0

            if (req.body.denda === 'true') {
                const dataDenda = await tarif_denda.findOne({
                    where: {
                        kendaraan_id: req.body.kendaraan_id,
                    },
                })

                const dendaTiket = dataDenda.denda_tiket || 0

                const dendaStnk = dataDenda.denda_stnk || 0

                if (req.body.is_tiket_hilang === 'true') {
                    biayaDendaTiket += dendaTiket
                }

                if (req.body.is_stnk_hilang === 'true') {
                    biayaDendaStnk += dendaStnk
                }
            }

            const data = await transaksi_tunai.create({
                ...req.body,
                parkir: biaya,
                jumlah_denda_tiket: biayaDendaTiket,
                jumlah_denda_stnk: biayaDendaStnk,
                interval: selisihJam,
            })

            return res.json({
                success: true,
                message: 'Create transaksi tunai successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await transaksi_tunai.findAll({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Get transaksi tunai successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await transaksi_tunai.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update transaksi tunai successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    updateTransaksi: async (req, res) => {
        try {
            const data = await transaksi_tunai.update(
                { ...req.body, is_active: false },
                {
                    where: {
                        no_tiket_atau_tiket_manual:
                            req.query.no_tiket_atau_tiket_manual,
                    },
                }
            )
            return res.json({
                success: true,
                message: 'Update transaksi tunai successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await transaksi_tunai.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete transaksi tunai successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
