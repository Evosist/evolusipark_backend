const errorhandler = require('../../helpers/errorhandler.helper')
const { sequelize } = require('../../models/index')
const dayjs = require('dayjs')

module.exports = {
  getResumePendapatanDashboard: async (req, res) => {
    try {
      const periods = {
        hari_ini: {
          label: 'Hari Ini',
          start: dayjs().startOf('day').toDate(),
          end: dayjs().endOf('day').toDate(),
        },
        minggu_ini: {
          label: 'Minggu Ini',
          start: dayjs().startOf('week').toDate(),
          end: dayjs().endOf('week').toDate(),
        },
        bulan_ini: {
          label: 'Bulan Ini',
          start: dayjs().startOf('month').toDate(),
          end: dayjs().endOf('month').toDate(),
        },
        tahun_ini: {
          label: 'Tahun Ini',
          start: dayjs().startOf('year').toDate(),
          end: dayjs().endOf('year').toDate(),
        },
      }

      const results = {}

      for (const key in periods) {
        const { start, end } = periods[key]

        const [data] = await sequelize.query(
          `
          SELECT
            COALESCE(SUM(CAST(biaya_parkir AS INTEGER)), 0) AS total_pendapatan,
            COUNT(*) AS jumlah_kendaraan
          FROM transaksis
          WHERE tanggal_keluar BETWEEN :start AND :end
            AND tanggal_keluar IS NOT NULL
          `,
          {
            replacements: { start, end },
            type: sequelize.QueryTypes.SELECT,
          }
        )

        results[key] = {
          label: periods[key].label,
          total_pendapatan: parseInt(data.total_pendapatan),
          jumlah_kendaraan: parseInt(data.jumlah_kendaraan),
        }
      }

      return res.json({
        success: true,
        message: 'Get resume pendapatan dashboard successfully',
        results,
      })
    } catch (err) {
      return errorhandler(res, err)
    }
  },
}
