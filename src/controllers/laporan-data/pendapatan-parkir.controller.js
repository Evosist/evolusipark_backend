const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    pendapatanDariCasual: async (req, res) => {
        const { start_date, end_date, search, sortBy, sortOrder, limit, page } =
            req.query

        if (!start_date || !end_date) {
            return res
                .status(400)
                .json({ message: 'start_date dan end_date wajib diisi' })
        }

        try {
            const parsedLimit = limit ? parseInt(limit) : null
            const parsedPage = page ? parseInt(page) : null
            const offset =
                parsedLimit && parsedPage
                    ? (parsedPage - 1) * parsedLimit
                    : null

            const validSortBy = sortBy || 'tanggal_keluar'
            const validSortOrder =
                sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
                    ? sortOrder.toLowerCase()
                    : 'desc'

            let query = `
            SELECT
                ROW_NUMBER() OVER (ORDER BY t.tanggal_keluar) AS "no",
                TO_CHAR(t.tanggal_keluar, 'YYYY-MM-DD') AS "tanggal",
                'Casual' AS "kategori",
                t.no_tiket_atau_tiket_manual AS "no_tiket",
                t.nomor_polisi AS "nopol",
                COALESCE(dm.nama, '-') AS "nama_member",
                CONCAT('Rp ', TO_CHAR(t.parkir::int, 'FM999G999')) AS "tarif_asli",
                COALESCE(pv.nama, '-') AS "nama_voucher",
                CONCAT('Rp ', TO_CHAR(COALESCE(dv.tarif, 0), 'FM999G999')) AS "potongan_voucher",
                CONCAT('Rp ', TO_CHAR((t.parkir::int - COALESCE(dv.tarif, 0)), 'FM999G999')) AS "tarif_dibayar",
                p.jenis_payment AS "pembayaran"
            FROM transaksi_tunais t
            LEFT JOIN data_vouchers dv ON dv.id = t.id_data_voucher
            LEFT JOIN produk_vouchers pv ON pv.id = dv.produk_voucher_id
            LEFT JOIN payments p ON p.id = t.jenis_pembayaran_id
            LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = t.nomor_polisi
            LEFT JOIN data_members dm ON dm.id = dnp.data_member_id
            WHERE t.tanggal_keluar IS NOT NULL
                AND t.tanggal_keluar::date BETWEEN :startDate AND :endDate
            `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                AND (
                    t.no_tiket_atau_tiket_manual ILIKE :search
                    OR t.nomor_polisi ILIKE :search
                    OR dm.nama ILIKE :search
                    OR pv.nama ILIKE :search
                    OR p.jenis_payment ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            const validSortColumns = {
                no: 'no',
                tanggal: 't.tanggal_keluar',
                kategori: 'kategori',
                no_tiket: 't.no_tiket_atau_tiket_manual',
                nopol: 't.nomor_polisi',
                nama_member: 'dm.nama',
                tarif_asli: 't.parkir',
                nama_voucher: 'pv.nama',
                potongan_voucher: 'dv.tarif',
                tarif_dibayar: '(t.parkir::int - COALESCE(dv.tarif, 0))',
                pembayaran: 'p.jenis_payment',
            }

            const orderByColumn =
                validSortColumns[sortBy] || validSortColumns.tanggal
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(*) AS total
            FROM transaksi_tunais t
            LEFT JOIN data_vouchers dv ON dv.id = t.id_data_voucher
            LEFT JOIN produk_vouchers pv ON pv.id = dv.produk_voucher_id
            LEFT JOIN payments p ON p.id = t.jenis_pembayaran_id
            LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = t.nomor_polisi
            LEFT JOIN data_members dm ON dm.id = dnp.data_member_id
            WHERE t.tanggal_keluar IS NOT NULL
                AND t.tanggal_keluar::date BETWEEN :startDate AND :endDate
        `

            if (search) {
                countQuery += `
                AND (
                    t.no_tiket_atau_tiket_manual ILIKE :search
                    OR t.nomor_polisi ILIKE :search
                    OR dm.nama ILIKE :search
                    OR pv.nama ILIKE :search
                    OR p.jenis_payment ILIKE :search
                )
            `
            }

            if (parsedLimit !== null && offset !== null) {
                query += ` LIMIT :limit OFFSET :offset`
                replacements.limit = parsedLimit
                replacements.offset = offset
            }

            const [[{ total }]] = await sequelize.query(countQuery, {
                replacements,
            })

            const [results] = await sequelize.query(query, {
                replacements,
            })

            return res.json({
                success: true,
                message: 'Get all pendapatan dari casual successfully',
                results: {
                    data: results,
                    totalData: parseInt(total),
                    totalPages: parsedLimit
                        ? Math.ceil(total / parsedLimit)
                        : 1,
                    currentPage: parsedPage || 1,
                    pageSize: parsedLimit || parseInt(total),
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    pendapatanDariMember: async (req, res) => {
        const { start_date, end_date, search, sortBy, sortOrder, limit, page } =
            req.query

        if (!start_date || !end_date) {
            return res
                .status(400)
                .json({ message: 'start_date dan end_date wajib diisi' })
        }

        try {
            const parsedLimit = limit ? parseInt(limit) : null
            const parsedPage = page ? parseInt(page) : null
            const offset =
                parsedLimit && parsedPage
                    ? (parsedPage - 1) * parsedLimit
                    : null

            const validSortBy = sortBy || 'tgl_masuk'
            const validSortOrder =
                sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
                    ? sortOrder.toLowerCase()
                    : 'asc'

            let query = `
            SELECT
                ROW_NUMBER() OVER (ORDER BY trx.tgl_masuk) AS "no",
                trx.no_tiket AS "no_tiket",
                TO_CHAR(trx.tgl_masuk, 'YYYY-MM-DD HH24:MI') AS "tanggal_masuk",
                pos.kode AS "pintu_masuk",
                CASE WHEN dm.id IS NOT NULL THEN 'Ya' ELSE 'Tidak' END AS "is_member",
                CONCAT(ROUND(trx.durasi_jam), ' Jam') AS "interval",
                COALESCE(
                    TO_CHAR(trx.tgl_keluar, 'YYYY-MM-DD HH24:MI'),
                    'Masih di dalam'
                ) AS "tanggal_keluar",
                CONCAT('Melebihi ', ROUND(trx.durasi_jam - 6), ' Jam') AS "durasi_overnight"
            FROM (
                SELECT 
                    t.no_tiket_atau_tiket_manual AS no_tiket,
                    t.tanggal_masuk AS tgl_masuk,
                    t.tanggal_keluar AS tgl_keluar,
                    EXTRACT(EPOCH FROM (COALESCE(t.tanggal_keluar, NOW()) - t.tanggal_masuk)) / 3600 AS durasi_jam,
                    t.pintu_masuk_id,
                    t.nomor_polisi
                FROM transaksi_tunais t
                WHERE t.tanggal_masuk::date BETWEEN :startDate AND :endDate
                    AND COALESCE(t.tanggal_keluar, NOW()) - t.tanggal_masuk > INTERVAL '6 hours'

                UNION ALL

                SELECT 
                    m.no_tiket_atau_tiket_manual,
                    m.tanggal_masuk,
                    m.tanggal_keluar,
                    EXTRACT(EPOCH FROM (COALESCE(m.tanggal_keluar, NOW()) - m.tanggal_masuk)) / 3600,
                    m.pintu_masuk_id,
                    m.nomor_polisi
                FROM transaksi_manuals m
                WHERE m.tanggal_masuk::date BETWEEN :startDate AND :endDate
                    AND COALESCE(m.tanggal_keluar, NOW()) - m.tanggal_masuk > INTERVAL '6 hours'
            ) trx
            LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = trx.nomor_polisi
            LEFT JOIN data_members dm ON dm.id = dnp.data_member_id
            LEFT JOIN pos ON pos.id = trx.pintu_masuk_id
        `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                WHERE (
                    trx.no_tiket ILIKE :search
                    OR trx.nomor_polisi ILIKE :search
                    OR pos.kode ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            const validSortColumns = {
                no: 'no',
                no_tiket: 'trx.no_tiket',
                tanggal_masuk: 'trx.tgl_masuk',
                pintu_masuk: 'pos.kode',
                is_member: 'dm.id',
                interval: 'trx.durasi_jam',
                tanggal_keluar: 'trx.tgl_keluar',
                durasi_overnight: 'trx.durasi_jam',
            }

            const orderByColumn =
                validSortColumns[sortBy] || validSortColumns.tanggal_masuk
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(*) AS total
            FROM (
                SELECT 
                    t.no_tiket_atau_tiket_manual AS no_tiket,
                    t.tanggal_masuk AS tgl_masuk,
                    t.tanggal_keluar AS tgl_keluar,
                    EXTRACT(EPOCH FROM (COALESCE(t.tanggal_keluar, NOW()) - t.tanggal_masuk)) / 3600 AS durasi_jam,
                    t.pintu_masuk_id,
                    t.nomor_polisi
                FROM transaksi_tunais t
                WHERE t.tanggal_masuk::date BETWEEN :startDate AND :endDate
                    AND COALESCE(t.tanggal_keluar, NOW()) - t.tanggal_masuk > INTERVAL '6 hours'

                UNION ALL

                SELECT 
                    m.no_tiket_atau_tiket_manual,
                    m.tanggal_masuk,
                    m.tanggal_keluar,
                    EXTRACT(EPOCH FROM (COALESCE(m.tanggal_keluar, NOW()) - m.tanggal_masuk)) / 3600,
                    m.pintu_masuk_id,
                    m.nomor_polisi
                FROM transaksi_manuals m
                WHERE m.tanggal_masuk::date BETWEEN :startDate AND :endDate
                    AND COALESCE(m.tanggal_keluar, NOW()) - m.tanggal_masuk > INTERVAL '6 hours'
            ) trx
            LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = trx.nomor_polisi
            LEFT JOIN data_members dm ON dm.id = dnp.data_member_id
            LEFT JOIN pos ON pos.id = trx.pintu_masuk_id
        `

            if (search) {
                countQuery += `
                WHERE (
                    trx.no_tiket ILIKE :search
                    OR trx.nomor_polisi ILIKE :search
                    OR pos.kode ILIKE :search
                )
            `
            }

            if (parsedLimit !== null && offset !== null) {
                query += ` LIMIT :limit OFFSET :offset`
                replacements.limit = parsedLimit
                replacements.offset = offset
            }

            const [[{ total }]] = await sequelize.query(countQuery, {
                replacements,
            })

            const [results] = await sequelize.query(query, {
                replacements,
            })

            return res.json({
                success: true,
                message: 'Get all pendapatan dari member successfully',
                results: {
                    data: results,
                    totalData: parseInt(total),
                    totalPages: parsedLimit
                        ? Math.ceil(total / parsedLimit)
                        : 1,
                    currentPage: parsedPage || 1,
                    pageSize: parsedLimit || parseInt(total),
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
