'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class dashboard_pendapatan extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    dashboard_pendapatan.init(
        {
            periode: DataTypes.ENUM(
                'hari_ini',
                'minggu_ini',
                'bulan_ini',
                'tahun_ini'
            ),
            tanggal: DataTypes.DATE,
            pendapatan: DataTypes.INTEGER,
            jumlah_kendaraan: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'dashboard_pendapatan',
        }
    )
    return dashboard_pendapatan
}
