'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class aktivitas_gerbang_kendaraan extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here

            aktivitas_gerbang_kendaraan.belongsTo(models.kendaraan, {
                foreignKey: 'kendaraan_id',
                as: 'kendaraan',
            })

            aktivitas_gerbang_kendaraan.belongsTo(models.user, {
                foreignKey: 'petugas_id',
                as: 'petugas',
            })
        }
    }
    aktivitas_gerbang_kendaraan.init(
        {
            tiket: DataTypes.STRING,
            plat_nomor: DataTypes.STRING,
            kendaraan_id: DataTypes.INTEGER,
            waktu: DataTypes.TIME,
            lokasi_gerbang: DataTypes.ENUM('Masuk', 'Keluar'),
            buka_atau_tutup: DataTypes.ENUM('Terbuka', 'Tertutup'),
            petugas_id: DataTypes.INTEGER,
            status_palang: DataTypes.ENUM('Sukses', 'Gagal (Sensor)'),
        },
        {
            sequelize,
            modelName: 'aktivitas_gerbang_kendaraan',
        }
    )
    return aktivitas_gerbang_kendaraan
}
