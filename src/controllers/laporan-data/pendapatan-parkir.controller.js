const errorhandler = require('../../helpers/errorhandler.helper')
const {
    data_kendaraan_masuk,
    data_kendaraan_keluar,
} = require('../../models/index')

module.exports = {
    pendapatanDariCasual: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
                SELECT 
                  t.no_tiket_atau_tiket_manual,
                  t.tanggal_masuk,
                  t.tanggal_keluar,
                  t.nomor_polisi,
                  k.nama_kendaraan,
                  pm.keterangan as pintu_masuk,
                  pk.keterangan as pintu_keluar
                FROM
                  transaksi_manuals t
                INNER JOIN
                  kendaraans k ON t.kendaraan_id = k.id
                INNER JOIN
                  pos pm ON t.pintu_masuk_id = pm.id
                INNER JOIN
                  pos pk ON t.pintu_keluar_id = pk.id
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
    pendapatanDariMember: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
                SELECT 
                  t.no_tiket_atau_tiket_manual,
                  t.tanggal_masuk,
                  t.tanggal_keluar,
                  t.nomor_polisi,
                  k.nama_kendaraan,
                  pm.keterangan as pintu_masuk,
                  pk.keterangan as pintu_keluar
                FROM
                  transaksi_manuals t
                INNER JOIN
                  kendaraans k ON t.kendaraan_id = k.id
                INNER JOIN
                  pos pm ON t.pintu_masuk_id = pm.id
                INNER JOIN
                  pos pk ON t.pintu_keluar_id = pk.id
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
