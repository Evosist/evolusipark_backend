const errorhandler = require('../../helpers/errorhandler.helper')
const {
    data_member,
    perusahaan,
    produk_member,
    data_nomor_polisi,
    riwayat_transaksi_kartu_member,
    riwayat_transaksi_ganti_nopol,
    user,
} = require('../../models/index')

module.exports = {
    getAll: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await data_member.findAndCountAll({
                include: [
                    { model: perusahaan, as: 'perusahaan' },
                    { model: produk_member, as: 'produk_member' },
                    { model: data_nomor_polisi, as: 'data_nomor_polisi' },
                    { model: user, as: 'user', attributes: ['id', 'nama'] },
                ],
                order: [[sortBy, sortOrder]],
                offset: offset,
                limit: limit,
            })
            return res.json({
                success: true,
                message: 'Get all data member successfully',
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
            const data = await data_member.create(req.body)
            return res.json({
                success: true,
                message: 'Create data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    perpanjangMasaAktif: async (req, res) => {
        try {
            const data = await data_member.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    gantiNopol: async (req, res) => {
        try {
            const data_nopol_lama = await data_nomor_polisi.findOne({
                where: {
                    nomor_polisi: req.body.nomor_polisi_lama,
                },
            })

            if (!data_nopol_lama) {
                return res.status(404).json({
                    success: false,
                    message: 'Nomor polisi lama tidak ditemukan',
                })
            }

            const data = await data_nomor_polisi.update(
                {
                    nomor_polisi: req.body.nomor_polisi_baru,
                    kendaraan_id: req.body.kendaraan_id,
                },
                {
                    where: {
                        nomor_polisi: req.body.nomor_polisi_lama,
                    },
                }
            )

            const produkMemberData = await data_member.findOne({
                where: {
                    id: req.params.id,
                },
                include: [{ model: produk_member, as: 'produk_member' }],
            })

            if (!produkMemberData) {
                return res.status(404).json({
                    success: false,
                    message: 'Produk member tidak ditemukan',
                })
            }

            await riwayat_transaksi_ganti_nopol.create({
                tgl_transaksi: new Date(),
                nomor_polisi_lama: req.body.nomor_polisi_lama,
                nomor_polisi_baru: req.body.nomor_polisi_baru,
                tarif: produkMemberData?.produk_member?.tarif,
                keterangan: req.body.keterangan,
                user_id: req.body.user_id,
            })

            return res.json({
                success: true,
                message: 'Update data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    gantiKartu: async (req, res) => {
        try {
            const data = await data_member.update(
                {
                    no_kartu: req.body.no_kartu,
                },
                {
                    where: {
                        id: req.params.id,
                    },
                }
            )

            const produkMemberData = await data_member.findOne({
                where: {
                    id: req.params.id,
                },
                include: [{ model: produk_member, as: 'produk_member' }],
            })

            if (!produkMemberData) {
                return res.status(404).json({
                    success: false,
                    message: 'Produk member tidak ditemukan',
                })
            }

            await riwayat_transaksi_kartu_member.create({
                tgl_transaksi: new Date(),
                no_kartu: req.body.no_kartu,
                tarif: produkMemberData?.produk_member?.tarif,
                keterangan: req.body.keterangan,
                user_id: req.body.user_id,
            })

            return res.json({
                success: true,
                message: 'Update data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    findOneById: async (req, res) => {
        try {
            const data = await data_member.findAll({
                where: {
                    id: req.params.id,
                },
                include: [
                    { model: perusahaan, as: 'perusahaan' },
                    { model: produk_member, as: 'produk_member' },
                    { model: data_nomor_polisi, as: 'data_nomor_polisi' },
                    { model: user, as: 'user', attributes: ['id', 'nama'] },
                ],
            })
            return res.json({
                success: true,
                message: 'Get data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    update: async (req, res) => {
        try {
            const data = await data_member.update(req.body, {
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Update data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    delete: async (req, res) => {
        try {
            const data = await data_member.destroy({
                where: {
                    id: req.params.id,
                },
            })
            return res.json({
                success: true,
                message: 'Delete data member successfully',
                results: data,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
