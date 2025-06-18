'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class log_aktivitas extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    log_aktivitas.init(
        {
            waktu: { type: DataTypes.DATE, allowNull: false },
            jenis: { type: DataTypes.STRING, allowNull: false },
            deskripsi: DataTypes.TEXT,
            lokasi: { type: DataTypes.STRING, allowNull: false },
            synced: { type: DataTypes.BOOLEAN, defaultValue: false },
        },
        {
            sequelize,
            modelName: 'log_aktivitas',
            timestamps: true,
            createdAt: 'createdAt',
            updatedAt: 'updatedAt',
        }
    )

    return log_aktivitas
}
