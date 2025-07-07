const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAllAuditTransaksiKendaraanKeluar: async (req, res) => {
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
                tm.tanggal_keluar::date AS "tanggal",
                'Casual' AS "kategori",
                tm.no_tiket_atau_tiket_manual AS "no_tiket",
                tm.nomor_polisi AS "nopol",
                '-' AS "nama_member",
                tm.parkir AS "tarif_asli",
                pv.nama AS "nama_voucher",
                COALESCE(dv.tarif, 0) AS "potongan_voucher",
                (CAST(tm.parkir AS INTEGER) - COALESCE(dv.tarif, 0)) AS "tarif_dibayar",
                pay.jenis_payment AS "pembayaran"
            FROM transaksi_manuals tm
            LEFT JOIN data_vouchers dv ON tm.id_data_voucher = dv.id
            LEFT JOIN produk_vouchers pv ON dv.produk_voucher_id = pv.id
            LEFT JOIN payments pay ON tm.jenis_pembayaran_id = pay.id
            WHERE tm.tanggal_keluar::date BETWEEN :startDate AND :endDate
        `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                AND (
                    tm.no_tiket_atau_tiket_manual ILIKE :search
                    OR tm.nomor_polisi ILIKE :search
                    OR pv.nama ILIKE :search
                    OR pay.jenis_payment ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            const validSortColumns = {
                tanggal: 'tm.tanggal_keluar',
                no_tiket: 'tm.no_tiket_atau_tiket_manual',
                nopol: 'tm.nomor_polisi',
                nama_voucher: 'pv.nama',
                pembayaran: 'pay.jenis_payment',
                tarif_asli: 'tm.parkir',
                potongan_voucher: 'dv.tarif',
                tarif_dibayar:
                    '(CAST(tm.parkir AS INTEGER) - COALESCE(dv.tarif, 0))',
            }

            const orderByColumn =
                validSortColumns[sortBy] || validSortColumns.tanggal
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(*) AS total
            FROM transaksi_manuals tm
            LEFT JOIN data_vouchers dv ON tm.id_data_voucher = dv.id
            LEFT JOIN produk_vouchers pv ON dv.produk_voucher_id = pv.id
            LEFT JOIN payments pay ON tm.jenis_pembayaran_id = pay.id
            WHERE tm.tanggal_keluar::date BETWEEN :startDate AND :endDate
        `

            if (search) {
                countQuery += `
                AND (
                    tm.no_tiket_atau_tiket_manual ILIKE :search
                    OR tm.nomor_polisi ILIKE :search
                    OR pv.nama ILIKE :search
                    OR pay.jenis_payment ILIKE :search
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
                message:
                    'Get all audit transaksi kendaraan keluar successfully',
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
    getAllAuditTransaksiManual: async (req, res) => {
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

            const validSortBy = sortBy || 'qty_transaksi'
            const validSortOrder =
                sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
                    ? sortOrder.toLowerCase()
                    : 'desc'

            let query = `
            SELECT
                pos.kode AS "pos",
                u.nama AS "nama_petugas",
                COUNT(tm.id) AS "qty_transaksi",
                SUM(CAST(regexp_replace(tm.parkir, '[^0-9]', '', 'g') AS INTEGER)) AS "total_nominal"
            FROM transaksi_manuals tm
            LEFT JOIN users u ON tm.petugas_id = u.id
            LEFT JOIN pos ON tm.pintu_keluar_id = pos.id
            WHERE tm.tanggal_keluar::date BETWEEN :startDate AND :endDate
        `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                AND (
                    pos.kode ILIKE :search
                    OR u.nama ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            query += ` GROUP BY pos.kode, u.nama`

            const validSortColumns = {
                pos: 'pos.kode',
                nama_petugas: 'u.nama',
                qty_transaksi: 'qty_transaksi',
                total_nominal: 'total_nominal',
            }

            const orderByColumn =
                validSortColumns[sortBy] || validSortColumns.qty_transaksi
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(DISTINCT (pos.kode, u.nama)) AS total
            FROM transaksi_manuals tm
            LEFT JOIN users u ON tm.petugas_id = u.id
            LEFT JOIN pos ON tm.pintu_keluar_id = pos.id
            WHERE tm.tanggal_keluar::date BETWEEN :startDate AND :endDate
        `

            if (search) {
                countQuery += `
                AND (
                    pos.kode ILIKE :search
                    OR u.nama ILIKE :search
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
                message: 'Get all audit transaksi manual successfully',
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
    getAllAuditTransaksiPenggunaanVoucher: async (req, res) => {
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

            const validSortBy = sortBy || 'qty_voucher_digunakan'
            const validSortOrder =
                sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
                    ? sortOrder.toLowerCase()
                    : 'desc'

            let query = `
            SELECT
                pv.nama AS "nama_voucher",
                CONCAT('Rp ', COALESCE(dv.tarif, 0)) AS "potongan_voucher",
                u.nama AS "nama_petugas_pos",
                COUNT(tm.id) AS "qty_voucher_digunakan"
            FROM transaksi_manuals tm
            INNER JOIN data_vouchers dv ON tm.id_data_voucher = dv.id
            INNER JOIN produk_vouchers pv ON dv.produk_voucher_id = pv.id
            INNER JOIN users u ON tm.petugas_id = u.id
            WHERE tm.tanggal_keluar::date BETWEEN :startDate AND :endDate
        `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                AND (
                    pv.nama ILIKE :search
                    OR u.nama ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            query += ` GROUP BY pv.nama, dv.tarif, u.nama`

            const validSortColumns = {
                nama_voucher: 'pv.nama',
                potongan_voucher: 'dv.tarif',
                nama_petugas_pos: 'u.nama',
                qty_voucher_digunakan: 'qty_voucher_digunakan',
            }

            const orderByColumn =
                validSortColumns[sortBy] ||
                validSortColumns.qty_voucher_digunakan
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(DISTINCT (pv.nama, dv.tarif, u.nama)) AS total
            FROM transaksi_manuals tm
            INNER JOIN data_vouchers dv ON tm.id_data_voucher = dv.id
            INNER JOIN produk_vouchers pv ON dv.produk_voucher_id = pv.id
            INNER JOIN users u ON tm.petugas_id = u.id
            WHERE tm.tanggal_keluar::date BETWEEN :startDate AND :endDate
        `

            if (search) {
                countQuery += `
                AND (
                    pv.nama ILIKE :search
                    OR u.nama ILIKE :search
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
                message:
                    'Get all audit transaksi penggunaan voucher successfully',
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
    getAllAuditPembatalanTransaksi: async (req, res) => {
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

            const validSortBy = sortBy || 'qty_transaksi_dibatalkan'
            const validSortOrder =
                sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
                    ? sortOrder.toLowerCase()
                    : 'desc'

            let query = `
            SELECT
                pos.kode AS "pos",
                u.nama AS "nama_petugas",
                COUNT(ltb.id) AS "qty_transaksi_dibatalkan",
                SUM(CAST(regexp_replace(ltb.total_pembayaran, '[^0-9]', '', 'g') AS INTEGER)) AS "total_nominal_pembatalan"
            FROM laporan_transaksi_batals ltb
            LEFT JOIN users u ON ltb.petugas_id = u.id
            LEFT JOIN pos ON ltb.gerbang_keluar_id = pos.id
            WHERE ltb."createdAt"::date BETWEEN :startDate AND :endDate
        `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                AND (
                    pos.kode ILIKE :search
                    OR u.nama ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            query += ` GROUP BY pos.kode, u.nama`

            const validSortColumns = {
                pos: 'pos.kode',
                nama_petugas: 'u.nama',
                qty_transaksi_dibatalkan: 'qty_transaksi_dibatalkan',
                total_nominal_pembatalan: 'total_nominal_pembatalan',
            }

            const orderByColumn =
                validSortColumns[sortBy] ||
                validSortColumns.qty_transaksi_dibatalkan
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(DISTINCT (pos.kode, u.nama)) AS total
            FROM laporan_transaksi_batals ltb
            LEFT JOIN users u ON ltb.petugas_id = u.id
            LEFT JOIN pos ON ltb.gerbang_keluar_id = pos.id
            WHERE ltb."createdAt"::date BETWEEN :startDate AND :endDate
        `

            if (search) {
                countQuery += `
                AND (
                    pos.kode ILIKE :search
                    OR u.nama ILIKE :search
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
                message: 'Get all audit pembatalan transaksi successfully',
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
