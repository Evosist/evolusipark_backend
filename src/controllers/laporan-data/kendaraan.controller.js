const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAllDataKendaraanIn: async (req, res) => {
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
                TO_CHAR(trx.tgl_keluar, 'YYYY-MM-DD HH24:MI') AS "tanggal_keluar",
                trx.nopol AS "nopol",
                tk.tipe_kendaraan AS "jenis_kendaraan",
                pos_in.kode AS "pintu_masuk",
                pos_out.kode AS "pintu_keluar",
                trx.interval AS "durasi_parkir",
                CASE 
                    WHEN trx.tarif = 0 THEN 'Gratis'
                    ELSE CONCAT('Rp ', TO_CHAR(trx.tarif, 'FM999G999')) 
                END AS "tarif",
                CASE 
                    WHEN dm.id IS NOT NULL THEN 'Member'
                    ELSE 'Bukan Member'
                END AS "StatusMember",
                COALESCE(p.nama, '-') AS "asal_perusahaan"
            FROM (
                SELECT 
                    t.no_tiket_atau_tiket_manual AS no_tiket,
                    t.tanggal_masuk AS tgl_masuk,
                    t.tanggal_keluar AS tgl_keluar,
                    t.nomor_polisi AS nopol,
                    t.pintu_masuk_id,
                    t.pintu_keluar_id,
                    t.kendaraan_id,
                    t.interval,
                    t.jumlah_denda_tiket AS tarif,
                    dnp.data_member_id
                FROM transaksi_tunais t
                LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = t.nomor_polisi
                WHERE t.tanggal_keluar IS NOT NULL
                AND t.tanggal_masuk::date BETWEEN :startDate AND :endDate

                UNION ALL

                SELECT 
                    m.no_tiket_atau_tiket_manual AS no_tiket,
                    m.tanggal_masuk AS tgl_masuk,
                    m.tanggal_keluar AS tgl_keluar,
                    m.nomor_polisi AS nopol,
                    m.pintu_masuk_id,
                    m.pintu_keluar_id,
                    m.kendaraan_id,
                    m.interval,
                    m.jumlah_denda_tiket AS tarif,
                    dnp.data_member_id
                FROM transaksi_manuals m
                LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = m.nomor_polisi
                WHERE m.tanggal_keluar IS NOT NULL
                AND m.tanggal_masuk::date BETWEEN :startDate AND :endDate
            ) trx
            LEFT JOIN kendaraans k ON k.id = trx.kendaraan_id
            LEFT JOIN tipe_kendaraans tk ON tk.id = k.tipe_kendaraan_id
            LEFT JOIN pos pos_in ON pos_in.id = trx.pintu_masuk_id
            LEFT JOIN pos pos_out ON pos_out.id = trx.pintu_keluar_id
            LEFT JOIN data_members dm ON dm.id = trx.data_member_id
            LEFT JOIN perusahaans p ON p.id = dm.perusahaan_id
            `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                WHERE (
                    trx.no_tiket ILIKE :search
                    OR trx.nopol ILIKE :search
                    OR tk.tipe_kendaraan ILIKE :search
                    OR pos_in.kode ILIKE :search
                    OR pos_out.kode ILIKE :search
                    OR p.nama ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            const validSortColumns = {
                no: 'no',
                no_tiket: 'trx.no_tiket',
                tanggal_masuk: 'trx.tgl_masuk',
                tanggal_keluar: 'trx.tgl_keluar',
                nopol: 'trx.nopol',
                jenis_kendaraan: 'tk.tipe_kendaraan',
                pintu_masuk: 'pos_in.kode',
                pintu_keluar: 'pos_out.kode',
                durasi_parkir: 'trx.interval',
                tarif: 'trx.tarif',
                StatusMember: 'StatusMember',
                asal_perusahaan: 'p.nama',
            }

            const orderByColumn =
                validSortColumns[sortBy] || validSortColumns.tgl_masuk
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(*) AS total
            FROM (
                SELECT 
                    t.no_tiket_atau_tiket_manual AS no_tiket,
                    t.tanggal_masuk AS tgl_masuk,
                    t.tanggal_keluar AS tgl_keluar,
                    t.nomor_polisi AS nopol,
                    t.pintu_masuk_id,
                    t.pintu_keluar_id,
                    t.kendaraan_id,
                    t.interval,
                    t.jumlah_denda_tiket AS tarif,
                    dnp.data_member_id
                FROM transaksi_tunais t
                LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = t.nomor_polisi
                WHERE t.tanggal_keluar IS NOT NULL
                AND t.tanggal_masuk::date BETWEEN :startDate AND :endDate

                UNION ALL

                SELECT 
                    m.no_tiket_atau_tiket_manual AS no_tiket,
                    m.tanggal_masuk AS tgl_masuk,
                    m.tanggal_keluar AS tgl_keluar,
                    m.nomor_polisi AS nopol,
                    m.pintu_masuk_id,
                    m.pintu_keluar_id,
                    m.kendaraan_id,
                    m.interval,
                    m.jumlah_denda_tiket AS tarif,
                    dnp.data_member_id
                FROM transaksi_manuals m
                LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = m.nomor_polisi
                WHERE m.tanggal_keluar IS NOT NULL
                AND m.tanggal_masuk::date BETWEEN :startDate AND :endDate
            ) trx
            LEFT JOIN kendaraans k ON k.id = trx.kendaraan_id
            LEFT JOIN tipe_kendaraans tk ON tk.id = k.tipe_kendaraan_id
            LEFT JOIN pos pos_in ON pos_in.id = trx.pintu_masuk_id
            LEFT JOIN pos pos_out ON pos_out.id = trx.pintu_keluar_id
            LEFT JOIN data_members dm ON dm.id = trx.data_member_id
            LEFT JOIN perusahaans p ON p.id = dm.perusahaan_id
        `

            if (search) {
                countQuery += `
                WHERE (
                    trx.no_tiket ILIKE :search
                    OR trx.nopol ILIKE :search
                    OR tk.tipe_kendaraan ILIKE :search
                    OR pos_in.kode ILIKE :search
                    OR pos_out.kode ILIKE :search
                    OR p.nama ILIKE :search
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
                message: 'Get all data kendaraan masuk successfully',
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
    getAllDataKendaraanOut: async (req, res) => {
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

            const validSortBy = sortBy || 'waktu_keluar'
            const validSortOrder =
                sortOrder && ['asc', 'desc'].includes(sortOrder.toLowerCase())
                    ? sortOrder.toLowerCase()
                    : 'desc'

            let query = `
            SELECT
                ltb.no AS "No",
                ltb.nomor_tiket AS "no_tiket",
                CASE WHEN ltb.member THEN 'Ya' ELSE 'Tidak' END AS "is_member",
                CASE WHEN ltb.manual_input THEN 'Ya' ELSE 'Tidak' END AS "is_manual",
                TO_CHAR(ltb.waktu_masuk, 'YYYY-MM-DD HH24:MI') AS "tgl_masuk",
                TO_CHAR(ltb.waktu_keluar, 'YYYY-MM-DD HH24:MI') AS "tgl_keluar",
                pos_in.kode AS "pintu_masuk",
                pos_out.kode AS "pintu_keluar",
                ltb.nomor_polisi AS "nopol",
                tk.tipe_kendaraan AS "kendaraan",
                ltb.durasi_parkir AS "interval",
                CASE 
                    WHEN ltb.total_pembayaran = '0' THEN 'Gratis'
                    ELSE ltb.total_pembayaran 
                END AS "tarif",
                ltb.denda AS "denda",
                CASE WHEN ltb.status THEN 'Selesai' ELSE 'Batal' END AS "status",
                ltb.tipe AS "tipe",
                ltb.pembayaran AS "pembayaran",
                CASE WHEN ltb.kartu_member THEN 'Ya' ELSE 'Tidak' END AS "prepaid_card",
                COALESCE(dm.no_kartu, '-') AS "no_prepaid_card",
                u.nama AS "petugas",
                s.nama_shift AS "shift"
            FROM public.laporan_transaksi_batals ltb
            LEFT JOIN public.kendaraans k ON k.id = ltb.jenis_kendaraan_id
            LEFT JOIN public.tipe_kendaraans tk ON tk.id = k.tipe_kendaraan_id
            LEFT JOIN public.users u ON u.id = ltb.petugas_id
            LEFT JOIN public.shifts s ON s.id = ltb.shift_id
            LEFT JOIN public.pos pos_in ON pos_in.id = ltb.gerbang_masuk_id
            LEFT JOIN public.pos pos_out ON pos_out.id = ltb.gerbang_keluar_id
            LEFT JOIN public.data_nomor_polisis dnp ON dnp.nomor_polisi = ltb.nomor_polisi
            LEFT JOIN public.data_members dm ON dm.id = dnp.data_member_id
            WHERE ltb.waktu_keluar IS NOT NULL
            AND ltb.waktu_keluar::date BETWEEN :startDate AND :endDate
        `

            const replacements = {
                startDate: start_date,
                endDate: end_date,
            }

            if (search) {
                query += `
                AND (
                    ltb.nomor_tiket ILIKE :search
                    OR ltb.nomor_polisi ILIKE :search
                    OR tk.tipe_kendaraan ILIKE :search
                    OR pos_in.kode ILIKE :search
                    OR pos_out.kode ILIKE :search
                    OR u.nama ILIKE :search
                    OR s.nama_shift ILIKE :search
                    OR dm.no_kartu ILIKE :search
                )
            `
                replacements.search = `%${search}%`
            }

            const validSortColumns = {
                No: 'ltb.no',
                no_tiket: 'ltb.nomor_tiket',
                is_member: 'ltb.member',
                is_manual: 'ltb.manual_input',
                tgl_masuk: 'ltb.waktu_masuk',
                tgl_keluar: 'ltb.waktu_keluar',
                pintu_masuk: 'pos_in.kode',
                pintu_keluar: 'pos_out.kode',
                nopol: 'ltb.nomor_polisi',
                kendaraan: 'tk.tipe_kendaraan',
                interval: 'ltb.durasi_parkir',
                tarif: 'ltb.total_pembayaran',
                denda: 'ltb.denda',
                status: 'ltb.status',
                tipe: 'ltb.tipe',
                pembayaran: 'ltb.pembayaran',
                prepaid_card: 'ltb.kartu_member',
                no_prepaid_card: 'dm.no_kartu',
                petugas: 'u.nama',
                shift: 's.nama_shift',
            }

            const orderByColumn =
                validSortColumns[sortBy] || validSortColumns.tgl_keluar
            query += ` ORDER BY ${orderByColumn} ${validSortOrder}`

            let countQuery = `
            SELECT COUNT(*) AS total
            FROM public.laporan_transaksi_batals ltb
            LEFT JOIN public.kendaraans k ON k.id = ltb.jenis_kendaraan_id
            LEFT JOIN public.tipe_kendaraans tk ON tk.id = k.tipe_kendaraan_id
            LEFT JOIN public.users u ON u.id = ltb.petugas_id
            LEFT JOIN public.shifts s ON s.id = ltb.shift_id
            LEFT JOIN public.pos pos_in ON pos_in.id = ltb.gerbang_masuk_id
            LEFT JOIN public.pos pos_out ON pos_out.id = ltb.gerbang_keluar_id
            LEFT JOIN public.data_nomor_polisis dnp ON dnp.nomor_polisi = ltb.nomor_polisi
            LEFT JOIN public.data_members dm ON dm.id = dnp.data_member_id
            WHERE ltb.waktu_keluar IS NOT NULL
            AND ltb.waktu_keluar::date BETWEEN :startDate AND :endDate
        `

            if (search) {
                countQuery += `
                AND (
                    ltb.nomor_tiket ILIKE :search
                    OR ltb.nomor_polisi ILIKE :search
                    OR tk.tipe_kendaraan ILIKE :search
                    OR pos_in.kode ILIKE :search
                    OR pos_out.kode ILIKE :search
                    OR u.nama ILIKE :search
                    OR s.nama_shift ILIKE :search
                    OR dm.no_kartu ILIKE :search
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
                message: 'Get all data kendaraan keluar successfully',
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
