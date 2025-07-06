const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAllDataKendaraanIn: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
                SELECT
                ROW_NUMBER() OVER (ORDER BY tgl_masuk) AS "no",
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
                ) trx
                LEFT JOIN kendaraans k ON k.id = trx.kendaraan_id
                LEFT JOIN tipe_kendaraans tk ON tk.id = k.tipe_kendaraan_id
                LEFT JOIN pos pos_in ON pos_in.id = trx.pintu_masuk_id
                LEFT JOIN pos pos_out ON pos_out.id = trx.pintu_keluar_id
                LEFT JOIN data_members dm ON dm.id = trx.data_member_id
                LEFT JOIN perusahaans p ON p.id = dm.perusahaan_id
                ORDER BY trx.tgl_masuk;
              `)

            return res.json({
                success: true,
                message: 'Get all data kendaraan masuk successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllDataKendaraanOut: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
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
                ORDER BY ltb.waktu_keluar DESC;
              `)

            return res.json({
                success: true,
                message: 'Get all data kendaraan keluar successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
