'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class data_kendaraan_masuk extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            data_kendaraan_masuk.belongsTo(models.kendaraan, {
                foreignKey: 'jenis_kendaraan_id',
                as: 'kendaraan',
            })

            data_kendaraan_masuk.belongsTo(models.pos, {
                foreignKey: 'pintu_masuk_id',
                as: 'pintu_masuk',
            })

            data_kendaraan_masuk.belongsTo(models.pos, {
                foreignKey: 'pintu_keluar_id',
                as: 'pintu_keluar',
            })

            data_kendaraan_masuk.belongsTo(models.perusahaan, {
                foreignKey: 'asal_perusahaan_id',
                as: 'perusahaan',
            })
        }
    }
    data_kendaraan_masuk.init(
        {
            no: DataTypes.INTEGER,
            no_tiket: DataTypes.STRING,
            tanggal_masuk: DataTypes.DATE,
            tanggal_keluar: DataTypes.DATE,
            nopol: DataTypes.STRING,
            jenis_kendaraan_id: DataTypes.INTEGER,
            pintu_masuk_id: DataTypes.INTEGER,
            pintu_keluar_id: DataTypes.INTEGER,
            durasi_parkir: DataTypes.STRING,
            tarif: DataTypes.STRING,
            status_member: DataTypes.STRING,
            asal_perusahaan_id: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'data_kendaraan_masuk',
        }
    )
    return data_kendaraan_masuk
}
