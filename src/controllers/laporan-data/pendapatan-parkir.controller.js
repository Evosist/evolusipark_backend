const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    pendapatanDariCasual: async (req, res) => {
        const { start_date, end_date } = req.query

        if (!start_date || !end_date) {
            return res
                .status(400)
                .json({ message: 'start_date dan end_date wajib diisi' })
        }

        try {
            const [results] = await sequelize.query(
                `
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
                ORDER BY t.tanggal_keluar DESC;
              `,
                {
                    replacements: {
                        startDate: start_date,
                        endDate: end_date,
                    },
                }
            )

            return res.json({
                success: true,
                message: 'Get all pendapatan dari casual successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    pendapatanDariMember: async (req, res) => {
        const { start_date, end_date } = req.query

        if (!start_date || !end_date) {
            return res
                .status(400)
                .json({ message: 'start_date dan end_date wajib diisi' })
        }

        try {
            const [results] = await sequelize.query(
                `
                SELECT
                ROW_NUMBER() OVER (ORDER BY tgl_masuk) AS "No",
                trx.no_tiket AS "NoTiket",
                TO_CHAR(trx.tgl_masuk, 'YYYY-MM-DD HH24:MI') AS "TanggalMasuk",
                pos.kode AS "PintuMasuk",
                CASE WHEN dm.id IS NOT NULL THEN 'Ya' ELSE 'Tidak' END AS "IsMember",
                CONCAT(ROUND(trx.durasi_jam), ' Jam') AS "Interval",
                COALESCE(
                  TO_CHAR(trx.tgl_keluar, 'YYYY-MM-DD HH24:MI'),
                  'Masih di dalam'
                ) AS "TanggalKeluar",
                CONCAT('Melebihi ', ROUND(trx.durasi_jam - 6), ' Jam') AS "DurasiOvernight"
                FROM (
                  SELECT 
                    t.no_tiket_atau_tiket_manual AS no_tiket,
                    t.tanggal_masuk AS tgl_masuk,
                    t.tanggal_keluar AS tgl_keluar,
                    EXTRACT(EPOCH FROM (COALESCE(t.tanggal_keluar, NOW()) - t.tanggal_masuk)) / 3600 AS durasi_jam,
                    t.pintu_masuk_id,
                    t.nomor_polisi
                  FROM transaksi_tunais t
                  WHERE t.tanggal_masuk BETWEEN :startDate AND :endDate
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
                  WHERE m.tanggal_masuk BETWEEN :startDate AND :endDate
                    AND COALESCE(m.tanggal_keluar, NOW()) - m.tanggal_masuk > INTERVAL '6 hours'
                ) trx
                LEFT JOIN data_nomor_polisis dnp ON dnp.nomor_polisi = trx.nomor_polisi
                LEFT JOIN data_members dm ON dm.id = dnp.data_member_id
                LEFT JOIN pos ON pos.id = trx.pintu_masuk_id
                ORDER BY trx.tgl_masuk ASC;
              `,
                {
                    replacements: {
                        startDate: start_date,
                        endDate: end_date,
                    },
                }
            )

            return res.json({
                success: true,
                message: 'Get all pendapatan dari member successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
