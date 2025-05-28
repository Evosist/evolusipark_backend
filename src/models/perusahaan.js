'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class perusahaan extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            perusahaan.belongsTo(models.user, {
                foreignKey: 'user_id',
                as: 'user',
            })
        }
    }
    perusahaan.init(
        {
            nama: DataTypes.STRING,
            jenis_perusahaan: DataTypes.ENUM(
                'Pemilik Gedung',
                'Tenant',
                'Developer'
            ),
            kontak: DataTypes.STRING,
            status: DataTypes.BOOLEAN,
            user_id: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'perusahaan',
        }
    )
    return perusahaan
}
