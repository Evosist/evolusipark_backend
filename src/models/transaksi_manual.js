'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class transaksi_manual extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            transaksi_manual.belongsTo(models.pos, {
                foreignKey: 'pintu_masuk_id',
                as: 'pintu_masuk',
            })

            transaksi_manual.belongsTo(models.pos, {
                foreignKey: 'pintu_keluar_id',
                as: 'pintu_keluar',
            })

            transaksi_manual.belongsTo(models.kendaraan, {
                foreignKey: 'kendaraan_id',
                as: 'kendaraan',
            })

            transaksi_manual.belongsTo(models.user, {
                foreignKey: 'petugas_id',
                as: 'petugas',
            })

            transaksi_manual.belongsTo(models.shift, {
                foreignKey: 'shift_id',
                as: 'shift',
            })

            transaksi_manual.belongsTo(models.payment, {
                foreignKey: 'jenis_pembayaran_id',
                as: 'jenis_pembayaran',
            })

            transaksi_manual.belongsTo(models.tipe_denda, {
                as: 'tipe_denda',
                foreignKey: 'tipe_denda_id',
            })

            transaksi_manual.belongsTo(models.data_voucher, {
                foreignKey: 'id_data_voucher',
                as: 'data_voucher',
            })
        }
    }
    transaksi_manual.init(
        {
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
            tipe_denda_id: DataTypes.INTEGER,
            is_active: DataTypes.BOOLEAN,
            jenis_pembayaran_id: DataTypes.INTEGER,
            parkir: DataTypes.STRING,
            id_data_voucher: DataTypes.INTEGER,
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
            keterangan_atau_penjelasan: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'transaksi_manual',
        }
    )
    return transaksi_manual
}
