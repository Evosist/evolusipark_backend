'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class laporan_over_night extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            laporan_over_night.belongsTo(models.pos, {
                foreignKey: 'pintu_masuk_id',
                as: 'petugas',
            })
        }
    }
    laporan_over_night.init(
        {
            no: DataTypes.INTEGER,
            no_tiket: DataTypes.STRING,
            tanggal_masuk: DataTypes.DATE,
            pintu_masuk_id: DataTypes.INTEGER,
            is_member: DataTypes.BOOLEAN,
            interval: DataTypes.STRING,
            tanggal_keluar: DataTypes.DATE,
            durasi_over_night: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'laporan_over_night',
        }
    )
    return laporan_over_night
}
