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
            })
        }
    }
    aktivitas_gerbang_kendaraan.init(
        {
            tiket: DataTypes.STRING,
            plat_nomor: DataTypes.STRING,
            kendaraan_id: DataTypes.INTEGER,
            waktu: DataTypes.DATE,
            lokasi_gerbang: DataTypes.STRING,
            buka_atau_tutup: DataTypes.STRING,
            petugas: DataTypes.STRING,
            status_palang: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'aktivitas_gerbang_kendaraan',
        }
    )
    return aktivitas_gerbang_kendaraan
}
