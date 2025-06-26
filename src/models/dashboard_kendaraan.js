'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class dashboard_kendaraan extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    dashboard_kendaraan.init(
        {
            tanggal: DataTypes.DATE,
            mobil: DataTypes.INTEGER,
            motor: DataTypes.INTEGER,
            truk_box: DataTypes.INTEGER,
            taxi: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'dashboard_kendaraan',
        }
    )
    return dashboard_kendaraan
}
