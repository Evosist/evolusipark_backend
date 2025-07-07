const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAllOvernight: async (req, res) => {
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

            const validSortBy = sortBy || 'tanggal_masuk'
            const validSortOrder =
                sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
                    ? sortOrder.toLowerCase()
                    : 'asc'

            let query = `
            SELECT
              tm.no_tiket_atau_tiket_manual AS "NoTiket",
              TO_CHAR(tm.tanggal_masuk, 'YYYY-MM-DD HH24:MI') AS "TanggalMasuk",
              pos.kode AS "PintuMasuk",
              CASE 
                  WHEN tm.id_member IS NOT NULL THEN 'Ya'
                  ELSE 'Tidak'
              END AS "IsMember",
              CONCAT(EXTRACT(HOUR FROM (COALESCE(tm.tanggal_keluar, NOW()) - tm.tanggal_masuk)), ' Jam') AS "Interval",
              COALESCE(TO_CHAR(tm.tanggal_keluar, 'YYYY-MM-DD HH24:MI'), 'Masih di dalam') AS "TanggalKeluar",
              CONCAT('Melebihi ', GREATEST(0, EXTRACT(HOUR FROM (COALESCE(tm.tanggal_keluar, NOW()) - tm.tanggal_masuk)) - 6), ' Jam') AS "DurasiOvernight"
            FROM transaksi_manuals tm
            LEFT JOIN pos ON tm.pintu_masuk_id = pos.id
            WHERE tm.tanggal_masuk::date BETWEEN :startDate AND :endDate
            AND EXTRACT(HOUR FROM (COALESCE(tm.tanggal_keluar, NOW()) - tm.tanggal_masuk)) > 6
        `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                AND (
                    tm.no_tiket_atau_tiket_manual ILIKE :search
                    OR pos.kode ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            const validSortColumns = {
                NoTiket: 'tm.no_tiket_atau_tiket_manual',
                TanggalMasuk: 'tm.tanggal_masuk',
                PintuMasuk: 'pos.kode',
                IsMember: 'tm.id_member',
                Interval: 'Interval',
                TanggalKeluar: 'tm.tanggal_keluar',
                DurasiOvernight: 'DurasiOvernight',
            }

            const orderByColumn =
                validSortColumns[sortBy] || validSortColumns.TanggalMasuk
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(*) AS total
            FROM transaksi_manuals tm
            LEFT JOIN pos ON tm.pintu_masuk_id = pos.id
            WHERE tm.tanggal_masuk::date BETWEEN :startDate AND :endDate
                AND EXTRACT(HOUR FROM (COALESCE(tm.tanggal_keluar, NOW()) - tm.tanggal_masuk)) > 6
        `

            if (search) {
                countQuery += `
                AND (
                    tm.no_tiket_atau_tiket_manual ILIKE :search
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
                message: 'Get all audit transaksi overnight successfully',
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
