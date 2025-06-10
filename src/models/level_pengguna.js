'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class level_pengguna extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            level_pengguna.hasOne(models.user, {
                foreignKey: 'level_pengguna_id',
                as: 'user',
            })

            level_pengguna.hasOne(models.perusahaan, {
                foreignKey: 'level_pengguna_id',
                as: 'perusahaan',
            })
        }
    }
    level_pengguna.init(
        {
            nama: DataTypes.STRING,
            hak_akses: DataTypes.JSONB,
        },
        {
            sequelize,
            modelName: 'level_pengguna',
        }
    )
    return level_pengguna
}
