'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class data_kendaraan_keluar extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            data_kendaraan_keluar.belongsTo(models.pos, {
                foreignKey: 'pintu_masuk_id',
                as: 'pintu_masuk',
            })

            data_kendaraan_keluar.belongsTo(models.pos, {
                foreignKey: 'pintu_keluar_id',
                as: 'pintu_keluar',
            })

            data_kendaraan_keluar.belongsTo(models.kendaraan, {
                foreignKey: 'kendaraan_id',
                as: 'kendaraan',
            })

            data_kendaraan_keluar.belongsTo(models.user, {
                foreignKey: 'petugas_id',
                as: 'petugas',
            })

            data_kendaraan_keluar.belongsTo(models.shift, {
                foreignKey: 'shift_id',
                as: 'shift',
            })
        }
    }
    data_kendaraan_keluar.init(
        {
            no: DataTypes.INTEGER,
            no_tiket: DataTypes.STRING,
            is_member: DataTypes.BOOLEAN,
            is_manual: DataTypes.BOOLEAN,
            tanggal_masuk: DataTypes.DATE,
            tanggal_keluar: DataTypes.DATE,
            pintu_masuk_id: DataTypes.INTEGER,
            pintu_keluar_id: DataTypes.INTEGER,
            nopol: DataTypes.STRING,
            kendaraan_id: DataTypes.INTEGER,
            interval: DataTypes.STRING,
            tarif: DataTypes.STRING,
            denda: DataTypes.STRING,
            status: DataTypes.STRING,
            tipe: DataTypes.STRING,
            pembayaran: DataTypes.STRING,
            prepaid_card: DataTypes.BOOLEAN,
            no_prepaid_card: DataTypes.STRING,
            petugas_id: DataTypes.INTEGER,
            shift_id: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'data_kendaraan_keluar',
        }
    )
    return data_kendaraan_keluar
}
