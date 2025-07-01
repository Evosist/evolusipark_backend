const errorhandler = require('../../helpers/errorhandler.helper')
const {
    data_kendaraan_masuk,
    data_kendaraan_keluar,
    sequelize,
} = require('../../models/index')

module.exports = {
    getAllDataKendaraanIn: async (req, res) => {
        try {
            const [results, metadata] = await sequelize.query(`
                SELECT 
                  t.no_tiket_atau_tiket_manual,
                  t.tanggal_masuk,
                  t.tanggal_keluar,
                  t.nomor_polisi,
                  k.nama_kendaraan,
                  pm.keterangan as pintu_masuk,
                  pk.keterangan as pintu_keluar,
                  pr.nama as nama_perusahaan,
                INNER JOIN
                  kendaraan k ON t.kendaraan_id = k.id
                INNER JOIN
                  pos p ON t.pintu_masuk_id = p.id
                INNER JOIN
                  perusahaan pr ON t.perusahaan_id = pr.id
              `)

            return res.json({
                success: true,
                message: 'Get all data kendaraan masuk successfully',
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
    getAllDataKendaraanOut: async (req, res) => {
        try {
            const limit = parseInt(req.query.limit) || 5
            const page = parseInt(req.query.page) || 1
            const offset = (page - 1) * limit
            const sortBy = req.query.sortBy || 'id'
            const sortOrder = req.query.sortOrder || 'asc'
            const { count, rows } = await data_kendaraan_keluar.findAndCountAll(
                {
                    order: [[sortBy, sortOrder]],
                    offset: offset,
                    limit: limit,
                }
            )
            return res.json({
                success: true,
                message: 'Get all data kendaraan keluar successfully',
                results: {
                    data: rows,
                    totalData: count,
                    totalPages: Math.ceil(count / limit),
                    currentPage: page,
                    pageSize: limit,
                },
            })
        } catch (err) {
            return errorhandler(res, err)
        }
    },
}
