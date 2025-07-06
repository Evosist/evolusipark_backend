const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAllAuditTransaksiKendaraanKeluar: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
            SELECT
            tm.tanggal_keluar::date AS "Tanggal",
            'Casual' AS "Kategori",
            tm.no_tiket_atau_tiket_manual AS "NoTiket",
            tm.nomor_polisi AS "Nopol",
            '-' AS "NamaMember",
            tm.parkir AS "TarifAsli",
            pv.nama AS "NamaVoucher",
            COALESCE(dv.tarif, 0) AS "PotonganVoucher",
            (CAST(tm.parkir AS INTEGER) - COALESCE(dv.tarif, 0)) AS "TarifDibayar",
            pay.jenis_payment AS "Pembayaran"
            FROM transaksi_manuals tm
            LEFT JOIN data_vouchers dv ON tm.id_data_voucher = dv.id
            LEFT JOIN produk_vouchers pv ON dv.produk_voucher_id = pv.id
            LEFT JOIN payments pay ON tm.jenis_pembayaran_id = pay.id
            WHERE tm.tanggal_keluar BETWEEN '2025-06-29' AND '2025-07-06'
            ORDER BY tm.tanggal_keluar DESC  
            `)

            return res.json({
                success: true,
                message:
                    'Get all audit transaksi kendaraan keluar successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllAuditTransaksiManual: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
              SELECT
              pos.kode AS "Pos",
              u.nama AS "NamaPetugas",
              COUNT(tm.id) AS "QtyTransaksi",
              SUM(CAST(regexp_replace(tm.parkir, '[^0-9]', '', 'g') AS INTEGER)) AS "TotalNominal"
              FROM transaksi_manuals tm
              LEFT JOIN users u ON tm.petugas_id = u.id
              LEFT JOIN pos ON tm.pintu_keluar_id = pos.id
              WHERE tm.tanggal_keluar BETWEEN '2025-06-29' AND '2025-07-06'
              GROUP BY pos.kode, u.nama
              ORDER BY "QtyTransaksi" DESC          
              `)

            return res.json({
                success: true,
                message: 'Get all audit transaksi manual successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllAuditTransaksiPenggunaanVoucher: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
                 SELECT
                 pv.nama AS "NamaVoucher",
                 CONCAT('Rp ', COALESCE(dv.tarif, 0)) AS "PotonganVoucher",
                 u.nama AS "NamaPetugasPos",
                 COUNT(tm.id) AS "QtyVoucherDigunakan"
                 FROM transaksi_manuals tm
                 INNER JOIN data_vouchers dv ON tm.id_data_voucher = dv.id
                 INNER JOIN produk_vouchers pv ON dv.produk_voucher_id = pv.id
                 INNER JOIN users u ON tm.petugas_id = u.id
                 WHERE tm.tanggal_keluar::date BETWEEN '2025-06-29' AND '2025-07-06'
                 GROUP BY pv.nama, dv.tarif, u.nama
                 ORDER BY COUNT(tm.id) DESC
              `)

            return res.json({
                success: true,
                message:
                    'Get all audit transaksi penggunaan voucher successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllAuditPembatalanTransaksi: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
                SELECT
                pos.kode AS "Pos",
                u.nama AS "NamaPetugas",
                COUNT(ltb.id) AS "QtyTransaksiDibatalkan",
                SUM(CAST(regexp_replace(ltb.total_pembayaran, '[^0-9]', '', 'g') AS INTEGER)) AS "TotalNominalPembatalan"
                FROM laporan_transaksi_batals ltb
                LEFT JOIN users u ON ltb.petugas_id = u.id
                LEFT JOIN pos ON ltb.gerbang_keluar_id = pos.id
                WHERE ltb."createdAt"::date BETWEEN '2025-06-29' AND '2025-07-06'
                GROUP BY pos.kode, u.nama
                ORDER BY COUNT(ltb.id) DESC
              `)

            return res.json({
                success: true,
                message: 'Get all audit pembatalan transaksi successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
