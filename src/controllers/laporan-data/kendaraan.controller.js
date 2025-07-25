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
                sortBy = 'createdAt',
                sortOrder = 'desc',
                limit = 10,
                page = 1,
            } = req.query

            limit = parseInt(limit)
            page = parseInt(page)
            const offset = (page - 1) * limit

            // validasi kolom sort
            const allowedSort = [
                'createdAt',
                'tiket',
                'plat_nomor',
                'kendaraan_id',
            ]
            if (!allowedSort.includes(sortBy)) {
                sortBy = 'createdAt'
            }
            sortOrder = sortOrder.toLowerCase() === 'asc' ? 'ASC' : 'DESC'

            // WHERE clause dinamis
            const conditions = [`agk.tipe_gerbang = 'In'`]
            const replacements = {}

            if (start_date) {
                conditions.push(`agk."createdAt" >= :start_date`)
                replacements.start_date = start_date
            }
            if (end_date) {
                conditions.push(`agk."createdAt" <= :end_date`)
                replacements.end_date = end_date
            }
            if (search) {
                conditions.push(
                    `(agk.tiket ILIKE :search OR agk.plat_nomor ILIKE :search)`
                )
                replacements.search = `%${search}%`
            }

            // hanya tiket yang belum keluar
            conditions.push(`
            agk.tiket NOT IN (
              SELECT tiket FROM aktivitas_gerbang_kendaraans WHERE tipe_gerbang = 'Out'
            )
            `)

            const whereSql = conditions.length
                ? `WHERE ${conditions.join(' AND ')}`
                : ''

            // query data
            const dataQuery = `
            SELECT
              agk.tiket AS nomor_tiket,
              agk."createdAt" AS tanggal_masuk,
              agk.plat_nomor AS nomor_polisi,
              agk.kendaraan_id,
              agk.lokasi_gerbang,
              agk.buka_atau_tutup,
              NOW() - agk."createdAt" AS durasi,
              dm.id AS id_member
            FROM aktivitas_gerbang_kendaraans agk
            LEFT JOIN data_nomor_polisis dnp ON agk.kendaraan_id = dnp.kendaraan_id
            LEFT JOIN data_members dm ON dnp.data_member_id = dm.id
            ${whereSql}
            ORDER BY agk."${sortBy}" ${sortOrder}
            LIMIT :limit OFFSET :offset
            `

            // query total
            const countQuery = `
            SELECT COUNT(*) AS total
            FROM aktivitas_gerbang_kendaraans agk
            LEFT JOIN data_nomor_polisis dnp ON agk.kendaraan_id = dnp.kendaraan_id
            LEFT JOIN data_members dm ON dnp.data_member_id = dm.id
            ${whereSql}
            `

            replacements.limit = limit
            replacements.offset = offset

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

            const totalData = parseInt(countRows[0].total, 10)
            const totalPages = Math.ceil(totalData / limit)

            res.json({
                success: true,
                message: 'Get all kendaraan in successfully',
                results: {
                    data: rows,
                    totalData: totalData,
                    totalPages: totalPages,
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
                start_date,
                end_date,
                search,
                sortBy = 'tanggal_masuk',
                sortOrder = 'desc',
                limit = 10,
                page = 1,
            } = req.query

            // konversi ke angka
            limit = parseInt(limit)
            page = parseInt(page)
            const offset = (page - 1) * limit

            // validasi sortBy
            const allowedSort = [
                'tanggal_masuk',
                'nomor_tiket',
                'nomor_polisi',
                'kendaraan_id',
            ]
            if (!allowedSort.includes(sortBy)) {
                sortBy = 'tanggal_masuk'
            }

            sortOrder = sortOrder.toLowerCase() === 'asc' ? 'ASC' : 'DESC'

            const conditions = []
            const replacements = {}

            if (start_date) {
                conditions.push(`masuk."createdAt" >= :start_date`)
                replacements.start_date = start_date
            }
            if (end_date) {
                conditions.push(`keluar."createdAt" <= :end_date`)
                replacements.end_date = end_date
            }
            if (search) {
                conditions.push(`(
                masuk.tiket ILIKE :search
                OR masuk.plat_nomor ILIKE :search
                )`)
                replacements.search = `%${search}%`
            }

            const whereSql = conditions.length
                ? `WHERE ${conditions.join(' AND ')}`
                : ''

            // query data
            const dataQuery = `
            SELECT
              masuk.tiket AS nomor_tiket,
              masuk."createdAt" AS tanggal_masuk,
              masuk.plat_nomor AS nomor_polisi,
              masuk.kendaraan_id,
              keluar.lokasi_gerbang AS lokasi_gerbang,
              keluar.buka_atau_tutup AS buka_atau_tutup,
              keluar."createdAt" - masuk."createdAt" AS durasi,
              dm.id AS id_member
            FROM aktivitas_gerbang_kendaraans masuk
            JOIN aktivitas_gerbang_kendaraans keluar
              ON masuk.tiket = keluar.tiket
             AND masuk.tipe_gerbang = 'In'
             AND keluar.tipe_gerbang = 'Out'
            LEFT JOIN data_nomor_polisis dnp
              ON masuk.kendaraan_id = dnp.kendaraan_id
            LEFT JOIN data_members dm
              ON dnp.data_member_id = dm.id
            ${whereSql}
            ORDER BY "${sortBy}" ${sortOrder}
            LIMIT :limit OFFSET :offset
            `

            // query total
            const countQuery = `
            SELECT COUNT(*) AS total
            FROM (
              SELECT masuk.tiket
              FROM aktivitas_gerbang_kendaraans masuk
              JOIN aktivitas_gerbang_kendaraans keluar
                ON masuk.tiket = keluar.tiket
               AND masuk.tipe_gerbang = 'In'
               AND keluar.tipe_gerbang = 'Out'
              LEFT JOIN data_nomor_polisis dnp
                ON masuk.kendaraan_id = dnp.kendaraan_id
              LEFT JOIN data_members dm
                ON dnp.data_member_id = dm.id
              ${whereSql}
              GROUP BY masuk.tiket, masuk."createdAt", masuk.plat_nomor, masuk.kendaraan_id,
                       keluar.lokasi_gerbang, keluar.buka_atau_tutup, keluar."createdAt", dm.id
            ) AS subquery
            `

            replacements.limit = limit
            replacements.offset = offset

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

            const totalData = parseInt(countRows[0].total, 10)
            const totalPages = Math.ceil(totalData / limit)

            res.json({
                success: true,
                message: 'Get all kendaraan keluar successfully',
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
}
