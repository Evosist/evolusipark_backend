'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class user extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            user.belongsTo(models.user, {
                foreignKey: 'added_by',
                as: 'added_by_user',
            })

            user.belongsTo(models.level_akses, {
                foreignKey: 'level_akses_id',
                as: 'level_akses',
            })
        }
    }
    user.init(
        {
            nama: { type: DataTypes.STRING, unique: true },
            jenis_kelamin: DataTypes.ENUM('Laki-laki', 'Perempuan'),
            no_hp: DataTypes.STRING,
            alamat_lengkap: DataTypes.STRING,
            username: { type: DataTypes.STRING, unique: true },
            password: DataTypes.STRING,
            level_akses_id: DataTypes.INTEGER,
            status: DataTypes.BOOLEAN,
            added_by: { type: DataTypes.INTEGER, allowNull: true },
        },
        {
            sequelize,
            modelName: 'user',
        }
    )
    return user
}
