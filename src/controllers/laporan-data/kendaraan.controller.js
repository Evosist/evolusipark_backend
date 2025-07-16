const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')
const { QueryTypes } = require('sequelize')

module.exports = {
    getAllDataKendaraanIn: async (req, res) => {
        try {
            let {
                start_date,
                end_date,
                search,
                sortBy = 'tanggal_masuk',
                sortOrder = 'DESC',
                limit = 10,
                page = 1,
            } = req.query

            limit = parseInt(limit)
            page = parseInt(page)
            const offset = (page - 1) * limit

            // kolom yang diizinkan untuk sort
            const allowedSort = [
                'tanggal_masuk',
                'no_tiket_atau_tiket_manual',
                'nomor_polisi',
            ]
            if (!allowedSort.includes(sortBy)) sortBy = 'tanggal_masuk'
            if (!['ASC', 'DESC'].includes(sortOrder.toUpperCase()))
                sortOrder = 'DESC'

            // base condition
            let whereClause = `WHERE t.tanggal_keluar IS NULL`

            if (start_date && end_date) {
                whereClause += ` AND DATE(t.tanggal_masuk) BETWEEN '${start_date}' AND '${end_date}'`
            }

            if (search) {
                whereClause += ` AND (t.no_tiket_atau_tiket_manual ILIKE '%${search}%' OR t.nomor_polisi ILIKE '%${search}%')`
            }

            // hitung total
            const countQuery = `
            SELECT COUNT(*) AS total
            FROM transaksi_tunais t
            ${whereClause}
            `

            // ambil data
            const dataQuery = `
            SELECT 
              t.id,
              t.no_tiket_atau_tiket_manual AS no_tiket,
              t.tanggal_masuk,
              t.tanggal_keluar,
              t.nomor_polisi AS nopol,
              k.nama_kendaraan AS jenis_kendaraan,
              t.pintu_masuk_id,
              t.pintu_keluar_id,
              t.parkir AS durasi_parkir,
              t.jumlah_denda_tiket,
              t.jumlah_denda_stnk
            FROM transaksi_tunais t
            LEFT JOIN kendaraans k ON k.id = t.kendaraan_id
            ${whereClause}
            ORDER BY ${sortBy} ${sortOrder}
            LIMIT ${limit} OFFSET ${offset}
            `

            const totalResult = await sequelize.query(countQuery, {
                type: QueryTypes.SELECT,
            })
            const rows = await sequelize.query(dataQuery, {
                type: QueryTypes.SELECT,
            })

            const totalData = parseInt(totalResult[0].total, 10)
            const totalPages = Math.ceil(totalData / limit)

            res.json({
                success: true,
                message: 'Get all kendaraan in successfully',
                results: {
                    data: rows,
                    totalData,
                    totalPages,
                    currentPage: page,
                    pageSize: limit,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllDataKendaraanOut: async (req, res) => {
        try {
            let {
                page = 1,
                limit = 10,
                search = '',
                sortOrder = 'DESC',
                sortBy = 'tanggalKeluar',
                start_date,
                end_date,
            } = req.query

            page = parseInt(page)
            limit = parseInt(limit)
            const offset = (page - 1) * limit

            const startDate = start_date ? `'${start_date}'` : `'1970-01-01'`
            const endDate = end_date ? `'${end_date}'` : `'2100-01-01'`

            const replacements = {
                search: `%${search}%`,
                limit,
                offset,
            }

            const baseQuery = (table, isManual) => `
            SELECT DISTINCT ON (t.id)
              t.id,
              t.no_tiket_atau_tiket_manual AS "noTiket",
              t.nomor_polisi AS "nopol",
              k.nama_kendaraan AS "jenisKendaraan",
              t.tanggal_masuk AS "tanggalMasuk",
              t.tanggal_keluar AS "tanggalKeluar",
              pm.kode AS "pintuMasuk",
              pk.kode AS "pintuKeluar",
              s.nama_shift AS "shift",
              u.nama AS "petugas",
              CONCAT(t.interval, ' jam') AS "interval",
              CONCAT('Rp ', t.parkir) AS "tarif",
              CONCAT('Rp ', t.jumlah_denda_tiket + t.jumlah_denda_stnk) AS "denda",
              'Selesai' AS "status",
              'Reguler' AS "tipe",
              CASE
                WHEN t.jenis_pembayaran_id = 1 THEN 'Tunai'
                WHEN t.jenis_pembayaran_id = 2 THEN 'Gratis'
                ELSE 'Lainnya'
              END AS "pembayaran",
              ${isManual} AS "isManual",
              CASE
                WHEN dm.periode @> CURRENT_DATE THEN 'Ya'
                ELSE 'Tidak'
              END AS "isMember",
              '-' AS "noPrepaidCard",
              'Tidak' AS "prepaidCard"
            FROM ${table} t
            LEFT JOIN kendaraans k ON t.kendaraan_id = k.id
            LEFT JOIN pos pm ON t.pintu_masuk_id = pm.id
            LEFT JOIN pos pk ON t.pintu_keluar_id = pk.id
            LEFT JOIN users u ON t.petugas_id = u.id
            LEFT JOIN shifts s ON t.shift_id = s.id
            LEFT JOIN data_nomor_polisis dnp ON dnp.kendaraan_id = t.kendaraan_id
            LEFT JOIN data_members dm ON dm.id = dnp.data_member_id AND dm.periode @> CURRENT_DATE
            WHERE t.tanggal_keluar IS NOT NULL
              AND (t.no_tiket_atau_tiket_manual ILIKE :search OR t.nomor_polisi ILIKE :search)
              AND t."createdAt" BETWEEN ${startDate} AND ${endDate}
            ORDER BY t.id, dm.createdAt DESC
            `

            const fullQuery = `
            (${baseQuery('transaksi_tunais', `'Tidak'`)})
            UNION ALL
            (${baseQuery('transaksi_manuals', `'Ya'`)})
            ORDER BY "${sortBy}" ${sortOrder}
            LIMIT :limit OFFSET :offset;
            `

            const countQuery = `
            SELECT COUNT(*) AS total FROM (
              (${baseQuery('transaksi_tunais', `'Tidak'`)})
              UNION ALL
              (${baseQuery('transaksi_manuals', `'Ya'`)})
            ) AS sub;
            `

            const data = await sequelize.query(fullQuery, {
                replacements,
                type: sequelize.QueryTypes.SELECT,
            })

            const countResult = await sequelize.query(countQuery, {
                replacements,
                type: sequelize.QueryTypes.SELECT,
            })

            const totalData = parseInt(countResult[0].total)
            const totalPages = Math.ceil(totalData / limit)

            return res.status(200).json({
                success: true,
                message: 'Get all kendaraan out successfully',
                results: {
                    data,
                    totalData,
                    totalPages,
                    currentPage: page,
                    pageSize: limit,
                },
            })
        } catch (error) {
            return errorhandler(res, error)
        }
    },
}
