const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')

module.exports = {
    getAllOvernight: async (req, res) => {
        try {
            const [results] = await sequelize.query(
                `
                SELECT
                tm.no_tiket_atau_tiket_manual AS "NoTiket",
                tm.tanggal_masuk AS "TanggalMasuk",
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
                ORDER BY tm.tanggal_masuk ASC 
              `,
                {
                    replacements: {
                        startDate: '2025-06-29',
                        endDate: '2025-07-06',
                    },
                }
            )

            return res.json({
                success: true,
                message: 'Get all audit transaksi overnight successfully',
                results: results,
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
