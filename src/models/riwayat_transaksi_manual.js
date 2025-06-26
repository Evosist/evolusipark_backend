'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class riwayat_transaksi_manual extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            riwayat_transaksi_manual.belongsTo(models.pos, {
                foreignKey: 'gerbang_masuk_id',
                as: 'gerbang_masuk',
            })

            riwayat_transaksi_manual.belongsTo(models.pos, {
                foreignKey: 'pintu_keluar_id',
                as: 'pintu_keluar',
            })

            riwayat_transaksi_manual.belongsTo(models.jenis_kendaraan, {
                foreignKey: 'jenis_kendaraan_id',
                as: 'jenis_kendaraan',
            })
        }
    }
    riwayat_transaksi_manual.init(
        {
            no: DataTypes.INTEGER,
            nomor_tiket: DataTypes.STRING,
            waktu_masuk: DataTypes.DATE,
            gerbang_masuk_id: DataTypes.INTEGER,
            jenis_kendaraan_id: DataTypes.INTEGER,
            nomor_polisi: DataTypes.STRING,
            waktu_keluar: DataTypes.DATE,
            pintu_keluar_id: DataTypes.INTEGER,
            durasi_parkir: DataTypes.STRING,
            denda: DataTypes.STRING,
            total_pembayaran: DataTypes.STRING,
            jenis_transaksi: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'riwayat_transaksi_manual',
        }
    )
    return riwayat_transaksi_manual
}
