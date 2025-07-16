'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class jenis_transaksi extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    jenis_transaksi.init(
        {
            jenis_transaksi: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'jenis_transaksi',
        }
    )
    return jenis_transaksi
}
