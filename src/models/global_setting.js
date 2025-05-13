'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class global_setting extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    global_setting.init(
        {
            nama_operator: DataTypes.STRING,
            email_operator: DataTypes.STRING,
            no_telp_operator: DataTypes.STRING,
            no_fax_operator: DataTypes.STRING,
            alamat_operator: DataTypes.STRING,
            nama_lokasi: DataTypes.STRING,
            email_lokasi: DataTypes.STRING,
            no_telp_lokasi: DataTypes.STRING,
            no_fax_lokasi: DataTypes.STRING,
            alamat_lokasi: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'global_setting',
        }
    )
    return global_setting
}
