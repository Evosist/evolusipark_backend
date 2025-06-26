'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class dashboard_over_night extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    dashboard_over_night.init(
        {
            tanggal: DataTypes.DATE,
            nilai: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'dashboard_over_night',
        }
    )
    return dashboard_over_night
}
