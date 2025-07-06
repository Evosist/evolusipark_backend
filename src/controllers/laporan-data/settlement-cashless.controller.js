const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAll: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
                  SELECT
                  tm.no_tiket_atau_tiket_manual AS "no_tiket",
                  tm.tanggal_keluar AS "tanggal_keluar",
                  pos_out.kode AS "pintu_keluar",
                  tm.nomor_polisi AS "nopol",
                  k.nama_kendaraan AS "kendaraan",
                  tm."interval" AS "interval",
                  tm.parkir AS "tarif",
                  (tm.jumlah_denda_tiket + tm.jumlah_denda_stnk) AS "denda",
                  COALESCE(td.tipe_denda, 'Tidak Ada') AS "tipe_denda",
                  pay.jenis_payment AS "pembayaran",
                  CASE
                    WHEN pay.jenis_payment ILIKE '%QRIS%' THEN 'GoPay'
                    WHEN pay.jenis_payment ILIKE '%VA%' THEN 'Mandiri VA'
                    WHEN pay.jenis_payment ILIKE '%Wallet%' THEN 'OVO'
                    ELSE 'Credit Card'
                  END AS "channel",
                  '-' AS "VA_QR",
                  u.nama AS "petugas",
                  s.nama_shift AS "shift",
                  CONCAT('mtd-', tm.id) AS "transaction_id",
                  CONCAT('ORD-', tm.id) AS "order_id",
                  tm.tanggal_keluar AS "transaction_time",
                  TO_DATE('2025-07-10', 'YYYY-MM-DD') AS "settlement_time",
                  CASE
                    WHEN tm.is_active = true THEN 'Settled'
                    WHEN tm.is_active = false AND tm.denda = true THEN 'Gagal'
                    ELSE 'Pending'
                  END AS "settlement_status",
                  CONCAT('st_', TO_CHAR(tm.tanggal_keluar, 'YYYYMMDD'), '.csv') AS "file_settlement"
                  FROM transaksi_manuals tm
                  LEFT JOIN pos pos_out ON tm.pintu_keluar_id = pos_out.id
                  LEFT JOIN kendaraans k ON tm.kendaraan_id = k.id
                  LEFT JOIN tipe_dendas td ON tm.tipe_denda_id = td.id
                  LEFT JOIN payments pay ON tm.jenis_pembayaran_id = pay.id
                  LEFT JOIN users u ON tm.petugas_id = u.id
                  LEFT JOIN shifts s ON tm.shift_id = s.id
                  WHERE tm.tanggal_keluar BETWEEN '2025-06-29' AND '2025-07-06'
                  ORDER BY tm.tanggal_keluar DESC
              `)

            return res.json({
                success: true,
                message: 'Get all settlement cashless successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
