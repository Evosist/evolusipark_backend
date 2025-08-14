const errorhandler = require('../../helpers/errorhandler.helper')
const {
    transaksi,
    pos,
    kendaraan,
    user,
    shift,
    tarif_parkir,
    tarif_denda,
    tipe_kendaraan,
    payment,
    data_voucher,
    data_member,
    laporan_transaksi_batal,
    tipe_denda,
    tenant,
    data_nomor_polisi,
} = require('../../models/index')
const dayjs = require('dayjs')
const relativeTime = require('dayjs/plugin/relativeTime')
const { literal } = require('sequelize')
const Op = require('sequelize').Op

dayjs.extend(relativeTime)

// Generate nomor tiket unik
function generateNoTiket() {
    const now = dayjs().format('YYYYMMDDHHmmss')
    const random = Math.floor(Math.random() * 1000)
    return `TIK${now}${random}`
}

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
                        attributes: ['id', 'keterangan'],
                    },
                    {
                        model: pos,
                        as: 'pintu_keluar',
                        attributes: ['id', 'keterangan'],
                    },
                    {
                        model: kendaraan,
                        as: 'kendaraan',
                        attributes: [
                            'id',
                            'nama_kendaraan',
                            'tipe_kendaraan_id',
                        ],
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
                        attributes: [
                            'id',
                            'nama_shift',
                            'awal_shift',
                            'akhir_shift',
                        ],
                    },
                    {
                        model: user,
                        as: 'petugas',
                        attributes: ['id', 'nama'],
                    },
                    {
                        model: payment,
                        as: 'jenis_pembayaran',
                        attributes: ['id', 'jenis_payment', 'status'],
                    },
                    {
                        model: data_voucher,
                        as: 'data_voucher',
                    },
                    {
                        model: data_member,
                        as: 'data_member',
                    },
                    {
                        model: tipe_denda,
                        as: 'tipe_denda',
                    },
                    {
                        model: tenant,
                        as: 'tenant',
                        attributes: ['id', 'nama_tenant'],
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
                //=================================================================
                // Berhasil Untuk Pencarian Nomor Tiket dan Nomor Polisi
                //=================================================================
                options.where[Op.or] = [
                    { no_tiket: { [Op.iLike]: `%${search}%` } },
                    { nomor_polisi: { [Op.iLike]: `%${search}%` } },
                    //Kolom Tidak Ditemukan
                    // {
                    //     no_tiket_atau_tiket_manual: {
                    //         [Op.iLike]: `%${search}%`,
                    //     },
                    // },
                    ,
                ]

                /*
                options.where[Op.or] = [
                    literal(
                        `CAST("tanggal_masuk" AS TEXT) ILIKE '%${search}%'`
                    ),
                    {
                        '$pintu_masuk.keterangan$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    //=======================================================================
                    //Kolom Tidak Ditemukan
                    //=======================================================================
                    // {
                    //     no_tiket_atau_tiket_manual: {
                    //         [Op.iLike]: `%${search}%`,
                    //     },
                    // },
                    {
                        '$kendaraan.nama_kendaraan$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    { nomor_polisi: { [Op.iLike]: `%${search}%` } },
                    {
                        '$pintu_keluar.keterangan$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    {
                        tanggal_keluar: {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    {
                        '$petugas.nama$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                    {
                        '$shift.nama_shift$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },

                    ...(statusFilter !== null
                        ? [{ denda: statusFilter, is_active: statusFilter }]
                        : []),

                    {
                        '$kendaraan.nama_kendaraan$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },

                    {
                        '$tipe_denda.tipe_denda$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },

                    {
                        '$jenis_pembayaran.jenis_payment$': {
                            [Op.iLike]: `%${search}%`,
                        },
                    },

                    {
                        biaya_parkir: {
                            [Op.iLike]: `%${search}%`,
                        },
                    },

                    literal(
                        `CAST("jumlah_denda_stnk" AS TEXT) ILIKE '%${search}%'`
                    ),

                    literal(
                        `CAST("jumlah_denda_tiket" AS TEXT) ILIKE '%${search}%'`
                    ),

                    {
                        interval: {
                            [Op.iLike]: `%${search}%`,
                        },
                    },

                    {
                        keterangan_atau_penjelasan: {
                            [Op.iLike]: `%${search}%`,
                        },
                    },
                ]
                */
            }

            if (limit) {
                options.limit = limit
                options.offset = offset
            }

            const { count, rows } = await transaksi.findAndCountAll(options)

            return res.json({
                success: true,
                message: 'Get all transaksi successfully',
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
    // ===============================
    // Transaksi Masuk (CREATE)
    // ===============================
    create: async (req, res) => {
        try {
            // Cek transaksi aktif untuk nomor polisi ini
            const existingTrx = await transaksi.findOne({
                where: {
                    nomor_polisi: req.body.nomor_polisi,
                    tanggal_keluar: null,
                    is_active: true,
                },
            })

            if (existingTrx) {
                return res.status(400).json({
                    success: false,
                    message:
                        'Kendaraan ini masih memiliki transaksi aktif, tidak bisa membuat transaksi masuk baru',
                })
            }

            // Generate nomor tiket
            const noTiket = generateNoTiket()

            // Simpan transaksi masuk
            const data = await transaksi.create({
                ...req.body,
                no_tiket: noTiket,
                is_active: true,
                createdAt: new Date(),
                updatedAt: new Date(),
            })

            return res.json({
                success: true,
                message: 'Transaksi masuk berhasil dibuat',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await transaksi.findAll({
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

    // ===============================
    // Transaksi Keluar (UPDATE)
    // ===============================
    update: async (req, res) => {
        try {
            // Cari transaksi aktif
            const trx = await transaksi.findOne({
                where: {
                    nomor_polisi: req.body.nomor_polisi,
                    tanggal_keluar: null,
                    is_active: true,
                },
            })

            if (!trx) {
                return res.status(404).json({
                    success: false,
                    message:
                        'Transaksi masuk tidak ditemukan atau sudah keluar',
                })
            }

            // Cek member
            const dataMember = await data_nomor_polisi.findOne({
                where: {
                    kendaraan_id: trx.kendaraan_id,
                    nomor_polisi: trx.nomor_polisi,
                },
                include: [
                    {
                        model: data_member,
                        as: 'data_member',
                        where: {
                            periode: {
                                [Op.contains]: dayjs().format('YYYY-MM-DD'),
                            },
                        },
                    },
                ],
            })

            if (dataMember) {
                const jenisPembayaran = await payment.findOne({
                    where: { id: req.body.jenis_pembayaran_id },
                })

                if (
                    !jenisPembayaran ||
                    jenisPembayaran.jenis_payment.toLowerCase() !== 'member'
                ) {
                    return res.status(400).json({
                        success: false,
                        message:
                            'Jenis pembayaran untuk member hanya boleh "member"',
                    })
                }
                trx.biaya_parkir = 0
            }

            // Ambil tarif
            const dataTarifParkir = await tarif_parkir.findOne({
                where: { kendaraan_id: trx.kendaraan_id },
            })
            const dataTarifDenda = await tarif_denda.findOne({
                where: { kendaraan_id: trx.kendaraan_id },
            })

            if (!dataTarifParkir) {
                return res.status(404).json({
                    success: false,
                    message: 'Tarif parkir tidak ditemukan',
                })
            }
            if (!dataTarifDenda) {
                return res.status(404).json({
                    success: false,
                    message: 'Tarif denda tidak ditemukan',
                })
            }

            // Validasi waktu
            const waktu_masuk = dayjs(trx.tanggal_masuk)
            const waktu_keluar = dayjs(req.body.tanggal_keluar)
            if (waktu_keluar.isBefore(waktu_masuk)) {
                return res.status(400).json({
                    success: false,
                    message:
                        'Waktu keluar tidak boleh lebih awal dari waktu masuk',
                })
            }
            const selisihJam = Math.ceil(
                waktu_keluar.diff(waktu_masuk, 'hour', true)
            )

            // Hitung biaya parkir
            let biaya = 0
            if (!dataMember) {
                if (
                    req.body.jenis_perhitungan_pembayaran.toLowerCase() ===
                    'flat'
                ) {
                    biaya = dataTarifParkir.tarif_flat || 0
                } else {
                    const tarifPertama =
                        dataTarifParkir.tarif_rotasi_pertama || 0
                    const tarifKedua = dataTarifParkir.tarif_rotasi_kedua || 0
                    const tarifKetiga = dataTarifParkir.tarif_rotasi_ketiga || 0

                    if (selisihJam >= 1) biaya += tarifPertama
                    if (selisihJam >= 2) biaya += tarifKedua
                    if (selisihJam >= 3) biaya += (selisihJam - 2) * tarifKetiga
                }
            }

            // Hitung denda
            let biayaDendaTiket = 0
            let biayaDendaStnk = 0
            let biayaDendaKartuMember = 0

            const isDenda = req.body.denda === true || req.body.denda === 'true'
            const isTiketHilang =
                req.body.is_tiket_hilang === true ||
                req.body.is_tiket_hilang === 'true'
            const isStnkHilang =
                req.body.is_stnk_hilang === true ||
                req.body.is_stnk_hilang === 'true'
            const isKartuMemberHilang =
                req.body.is_kartu_member_hilang === true ||
                req.body.is_kartu_member_hilang === 'true'

            if (isDenda) {
                if (dataMember && dataTarifDenda.denda_member === false) {
                    biayaDendaTiket = 0
                    biayaDendaStnk = 0
                    biayaDendaKartuMember = 0
                } else {
                    if (isTiketHilang)
                        biayaDendaTiket = dataTarifDenda.denda_tiket || 0
                    if (isStnkHilang)
                        biayaDendaStnk = dataTarifDenda.denda_stnk || 0
                    if (isKartuMemberHilang)
                        biayaDendaKartuMember =
                            dataTarifDenda.denda_kartu_member || 0
                }
            }

            // Voucher
            if (req.body.id_data_voucher && !dataMember) {
                const dataVoucher = await data_voucher.findOne({
                    where: { id: req.body.id_data_voucher },
                })
                if (dataVoucher) {
                    const nilaiVoucher = dataVoucher.tarif || 0
                    biaya -= nilaiVoucher
                    if (biaya < 0) biaya = 0
                }
            }

            // Update transaksi keluar
            trx.tanggal_keluar = req.body.tanggal_keluar
            trx.pintu_keluar_id = req.body.pintu_keluar_id
            trx.petugas_id = req.body.petugas_id
            trx.shift_id = req.body.shift_id
            trx.jenis_pembayaran_id = req.body.jenis_pembayaran_id
            trx.jenis_perhitungan_pembayaran =
                req.body.jenis_perhitungan_pembayaran // flat / regular
            trx.biaya_parkir = biaya
            trx.jumlah_denda_tiket = biayaDendaTiket
            trx.jumlah_denda_stnk = biayaDendaStnk
            trx.jumlah_denda_member = biayaDendaKartuMember
            trx.interval = selisihJam
            trx.is_active = false
            trx.keterangan_atau_penjelasan =
                req.body.keterangan_atau_penjelasan || null
            trx.id_data_voucher = req.body.id_data_voucher || null

            await trx.save()

            return res.json({
                success: true,
                message: 'Transaksi keluar berhasil diupdate',
                results: trx,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    cancelTransaksi: async (req, res) => {
        try {
            const { no_tiket_atau_nomor_polisi } = req.query
            const { alasan_pembatalan, penjelasan_pembatalan, user_id } =
                req.body

            if (!no_tiket_atau_nomor_polisi) {
                return res.status(400).json({
                    message:
                        'Harus menyertakan no_tiket_atau_nomor_polisi di query',
                })
            }

            const transaksiData = await transaksi.findOne({
                where: {
                    is_active: true,
                    [Op.or]: [
                        { no_tiket: no_tiket_atau_nomor_polisi },
                        { nomor_polisi: no_tiket_atau_nomor_polisi },
                    ],
                },
            })

            if (!transaksiData) {
                return res.status(404).json({
                    message: 'Transaksi tidak ditemukan atau sudah tidak aktif',
                })
            }

            await transaksi.update(
                { is_active: false },
                {
                    where: { id: transaksiData.id },
                }
            )

            const laporan = await laporan_transaksi_batal.create({
                no_tiket: transaksiData.no_tiket,
                tanggal_masuk: transaksiData.tanggal_masuk,
                pintu_masuk_id: transaksiData.pintu_masuk_id,
                tanggal_pembatalan: new Date(),
                alasan_pembatalan,
                penjelasan_pembatalan,
                user_id,
            })

            return res.status(200).json({
                message: 'Transaksi berhasil dibatalkan',
                data: laporan,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await transaksi.destroy({
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
