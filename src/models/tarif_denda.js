'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class tarif_denda extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            tarif_denda.belongsTo(models.kendaraan, {
                foreignKey: 'kendaraan_id',
                as: 'kendaraan',
            })
        }
    }
    tarif_denda.init(
        {
            kendaraan_id: DataTypes.INTEGER,
            denda_tiket: DataTypes.STRING,
            denda_stnk: DataTypes.STRING,
            denda_member: DataTypes.BOOLEAN,
        },
        {
            sequelize,
            modelName: 'tarif_denda',
        }
    )
    return tarif_denda
}
