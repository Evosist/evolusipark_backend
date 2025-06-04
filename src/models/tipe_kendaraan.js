'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class tipe_kendaraan extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    tipe_kendaraan.init(
        {
            tipe_kendaraan: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'tipe_kendaraan',
        }
    )
    return tipe_kendaraan
}
