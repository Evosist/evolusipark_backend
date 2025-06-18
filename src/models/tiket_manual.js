'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class tiket_manual extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    tiket_manual.init(
        {
            barcode: { type: DataTypes.STRING, unique: true },
            jenis_pembayaran: DataTypes.TEXT,
            waktu_masuk: DataTypes.DATE,
            waktu_keluar: DataTypes.DATE,
            lokasi: DataTypes.TEXT,
            dicetak: { type: DataTypes.BOOLEAN, defaultValue: false },
            vehicle_type: DataTypes.TEXT,
            plat_nomor: DataTypes.TEXT,
            durasi_parkir: DataTypes.INTEGER,
            biaya: DataTypes.DECIMAL,
            synced: { type: DataTypes.BOOLEAN, defaultValue: false },
        },
        {
            sequelize,
            modelName: 'tiket_manual',
        }
    )
    return tiket_manual
}
