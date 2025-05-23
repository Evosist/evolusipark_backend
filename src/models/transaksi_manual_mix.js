'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class transaksi_manual_mix extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            transaksi_manual_mix.belongsTo(models.pos, {
                foreignKey: 'pintu_masuk_id',
                as: 'pintu_masuk',
            })

            transaksi_manual_mix.belongsTo(models.pos, {
                foreignKey: 'pintu_keluar_id',
                as: 'pintu_keluar',
            })

            transaksi_manual_mix.belongsTo(models.kendaraan, {
                foreignKey: 'kendaraan_id',
                as: 'kendaraan',
            })

            transaksi_manual_mix.belongsTo(models.user, {
                foreignKey: 'petugas_id',
                as: 'petugas',
            })

            transaksi_manual_mix.belongsTo(models.shift, {
                foreignKey: 'shift_id',
                as: 'shift',
            })
        }
    }
    transaksi_manual_mix.init(
        {
            is_manual: DataTypes.BOOLEAN,
            tanggal_masuk: DataTypes.DATE,
            pintu_masuk_id: DataTypes.INTEGER,
            no_tiket_atau_tiket_manual: DataTypes.STRING,
            kendaraan_id: DataTypes.INTEGER,
            nomor_polisi: DataTypes.STRING,
            pintu_keluar_id: DataTypes.INTEGER,
            tanggal_keluar: DataTypes.DATE,
            petugas_id: DataTypes.INTEGER,
            shift_id: DataTypes.INTEGER,
            denda: DataTypes.BOOLEAN,
            is_active: DataTypes.BOOLEAN,
            parkir: DataTypes.STRING,
            jumlah_denda_stnk: {
                type: DataTypes.INTEGER,
                allowNull: false,
                validate: { min: 0 },
            },
            jumlah_denda_tiket: {
                type: DataTypes.INTEGER,
                allowNull: false,
                validate: { min: 0 },
            },
            interval: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'transaksi_manual_mix',
        }
    )
    return transaksi_manual_mix
}
