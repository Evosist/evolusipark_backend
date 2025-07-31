const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')
const { Op, QueryTypes } = require('sequelize')

module.exports = {
    getAllAuditTransaksiKendaraanKeluar: async (req, res) => {
        try {
            const {
                start_date,
                end_date,
                search = '',
                sortBy = 'tanggal_keluar',
                sortOrder = 'DESC',
                limit = 10,
                page = 1,
            } = req.query

            const pageSize = parseInt(limit) || 10
            const currentPage = parseInt(page) || 1
            const offset = (currentPage - 1) * pageSize

            const allowedSortFields = [
                'tanggal_keluar',
                'no_tiket',
                'nomor_polisi',
                'nama_member',
            ]
            const sortField = allowedSortFields.includes(sortBy)
                ? sortBy
                : 'tanggal_keluar'

            const sortDirection =
                sortOrder.toUpperCase() === 'ASC' ? 'ASC' : 'DESC'

            let whereDate = ''
            if (start_date && end_date) {
                whereDate = ` AND t."tanggal_keluar" BETWEEN :startDate AND :endDate `
            }

            let whereSearch = ''
            if (search) {
                whereSearch = `
            AND (
              t."no_tiket" ILIKE :search
              OR t."nomor_polisi" ILIKE :search
              OR m."nama" ILIKE :search
            )
            `
            }

            const dataQuery = `
            SELECT
              t."tanggal_keluar" AS tanggal,
              t."no_tiket",
              t."nomor_polisi" AS nopol,
              m."nama" AS nama_member,
              t."biaya_parkir"::numeric AS tarif_asli,
              pv."nama" AS nama_voucher,
              dv."diskon" AS potongan_voucher,
              (t."biaya_parkir"::numeric - COALESCE(dv."diskon",0)) AS tarif_dibayar,
              p."jenis_payment" AS jenis_pembayaran
            FROM public.transaksis t
            LEFT JOIN public.data_members m ON t."id_data_member" = m."id"
            LEFT JOIN public.data_vouchers dv ON t."id_data_voucher" = dv."id"
            LEFT JOIN public.produk_vouchers pv ON dv."produk_voucher_id" = pv."id"
            LEFT JOIN public.payments p ON t."jenis_pembayaran_id" = p."id"
            WHERE t."tanggal_keluar" IS NOT NULL
            ${whereDate}
            ${whereSearch}
            ORDER BY "${sortField}" ${sortDirection}
            LIMIT :limit OFFSET :offset
            `

            const countQuery = `
            SELECT COUNT(*) AS total
            FROM public.transaksis t
            LEFT JOIN public.data_members m ON t."id_data_member" = m."id"
            LEFT JOIN public.data_vouchers dv ON t."id_data_voucher" = dv."id"
            LEFT JOIN public.produk_vouchers pv ON dv."produk_voucher_id" = pv."id"
            LEFT JOIN public.payments p ON t."jenis_pembayaran_id" = p."id"
            WHERE t."tanggal_keluar" IS NOT NULL
            ${whereDate}
            ${whereSearch}
            `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
                search: `%${search}%`,
                limit: pageSize,
                offset: offset,
            }

            const [rows, countRows] = await Promise.all([
                sequelize.query(dataQuery, {
                    replacements,
                    type: QueryTypes.SELECT,
                }),
                sequelize.query(countQuery, {
                    replacements,
                    type: QueryTypes.SELECT,
                }),
            ])

            const totalData = parseInt(countRows[0]?.total || 0, 10)
            const totalPages = Math.ceil(totalData / pageSize)

            return res.json({
                success: true,
                message:
                    'Get all audit transaksi kendaraan keluar successfully',
                results: {
                    data: rows,
                    totalData: totalData,
                    totalPages: totalPages,
                    currentPage: currentPage,
                    pageSize: pageSize,
                },
            })
        } catch (error) {
            return errorhandler(res, error)
        }
    },
    getAllAuditTransaksiManual: async (req, res) => {
        try {
            const search = req.query.search || ''
            const sortBy = req.query.sortBy || 'nama_pos'
            const sortOrder = req.query.sortOrder === 'desc' ? 'DESC' : 'ASC'
            const page = parseInt(req.query.page) || 1
            const pageSize = parseInt(req.query.pageSize) || 10

            const offset = (page - 1) * pageSize

            let whereSearch = ''
            if (search) {
                whereSearch = `
            AND (
              p.kode ILIKE :search OR
              u.nama ILIKE :search
            )
            `
            }

            const baseQuery = `
            FROM transaksis t
            JOIN pos p ON t.pintu_keluar_id = p.id
            JOIN users u ON t.petugas_id = u.id
            LEFT JOIN data_vouchers v ON t.id_data_voucher = v.id
            WHERE t.is_manual = true
            ${whereSearch}
            GROUP BY p.kode, u.nama
            `

            const countQuery = `
            SELECT COUNT(*) as total_count FROM (
              SELECT 1 ${baseQuery}
            ) AS subquery
            `

            const countResult = await sequelize.query(countQuery, {
                replacements: { search: `%${search}%` },
                type: QueryTypes.SELECT,
            })

            const totalData = parseInt(countResult[0].total_count, 10)
            const totalPages = Math.ceil(totalData / pageSize)

            const dataQuery = `
            SELECT
              p.kode AS nama_pos,
              u.nama AS nama_petugas,
              COUNT(t.id) AS qty_transaksi,
              COALESCE(SUM(CAST(t.biaya_parkir AS numeric)),0) AS total_biaya_parkir,
              COALESCE(SUM(COALESCE(v.diskon,0)),0) AS total_diskon,
              COALESCE(SUM(CAST(t.biaya_parkir AS numeric)) - SUM(COALESCE(v.diskon,0)),0) AS total_biaya_akhir
            ${baseQuery}
            ORDER BY ${sortBy} ${sortOrder}
            LIMIT :limit OFFSET :offset
            `

            const data = await sequelize.query(dataQuery, {
                replacements: {
                    search: `%${search}%`,
                    limit: pageSize,
                    offset: offset,
                },
                type: QueryTypes.SELECT,
            })

            res.json({
                success: true,
                message: 'Get all audit transaksi manual successfully',
                results: {
                    data: data,
                    totalData: totalData,
                    totalPages: totalPages,
                    currentPage: page,
                    pageSize: pageSize,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllAuditTransaksiPenggunaanVoucher: async (req, res) => {
        try {
            const {
                start_date,
                end_date,
                search,
                sortBy = 'nama_voucher',
                sortOrder = 'ASC',
                limit = 10,
                page = 1,
            } = req.query

            const whereClauses = []
            const replacements = {}

            if (start_date) {
                whereClauses.push(`t."createdAt" >= :start_date`)
                replacements.start_date = start_date
            }
            if (end_date) {
                whereClauses.push(`t."createdAt" <= :end_date`)
                replacements.end_date = end_date
            }

            if (search) {
                whereClauses.push(
                    `(pv.nama ILIKE :search OR u.nama ILIKE :search)`
                )
                replacements.search = `%${search}%`
            }

            const whereSQL =
                whereClauses.length > 0
                    ? `WHERE ${whereClauses.join(' AND ')}`
                    : ''

            const allowedSort = [
                'nama_voucher',
                'potongan_voucher',
                'nama_petugas_pos',
                'quantity_voucher_digunakan',
            ]
            const sortColumn = allowedSort.includes(sortBy)
                ? sortBy
                : 'nama_voucher'
            const order = sortOrder.toUpperCase() === 'DESC' ? 'DESC' : 'ASC'

            const pageSize = parseInt(limit, 10)
            const currentPage = parseInt(page, 10)
            const offset = (currentPage - 1) * pageSize

            const baseQuery = `
            SELECT
              pv.nama AS nama_voucher,
              pv.diskon AS potongan_voucher,
              u.nama AS nama_petugas_pos,
              COUNT(t.id) AS quantity_voucher_digunakan
            FROM transaksis t
            JOIN data_vouchers dv ON t.id_data_voucher = dv.id
            JOIN produk_vouchers pv ON dv.produk_voucher_id = pv.id
            JOIN users u ON t.petugas_id = u.id
            ${whereSQL}
            GROUP BY pv.nama, pv.diskon, u.nama
            `

            const totalDataResult = await sequelize.query(
                `SELECT COUNT(*) as count FROM (${baseQuery}) AS sub`,
                { replacements, type: QueryTypes.SELECT }
            )
            const totalData = parseInt(totalDataResult[0].count, 10)
            const totalPages = Math.ceil(totalData / pageSize)

            const finalQuery = `
            ${baseQuery}
            ORDER BY "${sortColumn}" ${order}
            LIMIT :limit OFFSET :offset
            `

            const data = await sequelize.query(finalQuery, {
                replacements: { ...replacements, limit: pageSize, offset },
                type: QueryTypes.SELECT,
            })

            res.json({
                success: true,
                message: 'Get all audit penggunaan voucher successfully',
                results: {
                    data,
                    totalData,
                    totalPages,
                    currentPage,
                    pageSize,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },

    getAllAuditPembatalanTransaksi: async (req, res) => {
    const { start_date, end_date, search, sortBy, sortOrder, limit, page } = req.query

    if (!start_date || !end_date) {
        return res
            .status(400)
            .json({ message: 'start_date dan end_date wajib diisi' })
    }

    try {
        const parsedLimit = limit ? parseInt(limit) : null
        const parsedPage = page ? parseInt(page) : null
        const offset = parsedLimit && parsedPage ? (parsedPage - 1) * parsedLimit : null

        const validSortBy = sortBy || 'qty_transaksi_dibatalkan'
        const validSortOrder = sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
            ? sortOrder.toLowerCase()
            : 'desc'

        let query = `
        SELECT
            pos.kode AS "pos",
            u.nama AS "nama_petugas",
            COUNT(t.id) AS "qty_transaksi_dibatalkan",
            SUM(CAST(regexp_replace(t.biaya_parkir, '[^0-9]', '', 'g') AS INTEGER)) AS "total_nominal_pembatalan"
        FROM transaksis t
        LEFT JOIN users u ON t.petugas_id = u.id
        LEFT JOIN pos ON t.pintu_keluar_id = pos.id
        WHERE t.is_active = false
          AND t."createdAt"::date BETWEEN :startDate AND :endDate
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
            )`
            replacements.search = `%${search}%`
        }

        query += ` GROUP BY pos.kode, u.nama`

        const validSortColumns = {
            pos: 'pos.kode',
            nama_petugas: 'u.nama',
            qty_transaksi_dibatalkan: 'qty_transaksi_dibatalkan',
            total_nominal_pembatalan: 'total_nominal_pembatalan',
        }

        const orderByColumn = validSortColumns[validSortBy] || validSortColumns.qty_transaksi_dibatalkan
        query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

        // Count query (jumlah kombinasi unik pos + petugas)
        let countQuery = `
        SELECT COUNT(DISTINCT (pos.kode, u.nama)) AS total
        FROM transaksis t
        LEFT JOIN users u ON t.petugas_id = u.id
        LEFT JOIN pos ON t.pintu_keluar_id = pos.id
        WHERE t.is_active = false
          AND t."createdAt"::date BETWEEN :startDate AND :endDate
        `
        if (search) {
            countQuery += `
            AND (
                pos.kode ILIKE :search
                OR u.nama ILIKE :search
            )`
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
                totalPages: parsedLimit ? Math.ceil(total / parsedLimit) : 1,
                currentPage: parsedPage || 1,
                pageSize: parsedLimit || parseInt(total),
            },
        })
    } catch (err) {
        return errorhandler(res, err)
    }
  },
}
