'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class level_akses extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            level_akses.hasOne(models.user, {
                foreignKey: 'level_akses_id',
                as: 'user',
            })

            level_akses.belongsTo(models.perusahaan, {
                foreignKey: 'perusahaan_id',
                as: 'perusahaan',
            })
        }
    }
    level_akses.init(
        {
            nama: DataTypes.STRING,
            perusahaan_id: DataTypes.INTEGER,
            hak_akses: DataTypes.JSONB,
        },
        {
            sequelize,
            modelName: 'level_akses',
        }
    )
    return level_akses
}
