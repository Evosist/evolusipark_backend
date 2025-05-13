'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class tarif_parkir extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            tarif_parkir.belongsTo(models.kendaraan, {
                foreignKey: 'kendaraan_id',
                as: 'kendaraan',
            })
        }
    }
    tarif_parkir.init(
        {
            kendaraan_id: DataTypes.INTEGER,
            grace_period: DataTypes.INTEGER,
            tarif_grace_period: DataTypes.STRING,
            rotasi_pertama: DataTypes.INTEGER,
            tarif_rotasi_pertama: DataTypes.STRING,
            rotasi_kedua: DataTypes.INTEGER,
            tarif_rotasi_kedua: DataTypes.STRING,
            rotasi_ketiga: DataTypes.INTEGER,
            tarif_rotasi_ketiga: DataTypes.STRING,
            tarif_maksimal: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'tarif_parkir',
        }
    )
    return tarif_parkir
}
