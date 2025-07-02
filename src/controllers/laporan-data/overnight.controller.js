const errorhandler = require('../../helpers/errorhandler.helper')
const {
    data_kendaraan_masuk,
    data_kendaraan_keluar,
} = require('../../models/index')

module.exports = {
    getAllOvernight: async (req, res) => {
        try {
            const [results] = await sequelize.query(`
                SELECT t.tanggal_masuk as tanggal,
                       t.no_tiket_atau_tiket_manual as no_tiket_atau_id_transaksi,
                       t.nomor_polisi as nopol,
                       m.nama as nama_member,
                       
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
}
