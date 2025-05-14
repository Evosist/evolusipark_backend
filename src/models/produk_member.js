'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class produk_member extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            produk_member.belongsTo(models.user, {
                foreignKey: 'user_id',
                as: 'user',
            })
        }
    }
    produk_member.init(
        {
            nama: DataTypes.STRING,
            periode_value: DataTypes.INTEGER,
            periode_unit: DataTypes.ENUM('Hari', 'Bulan', 'Tahun'),
            kendaraan_mb: DataTypes.BOOLEAN,
            kendaraan_mt: DataTypes.BOOLEAN,
            kendaraan_truck_atau_box: DataTypes.BOOLEAN,
            max_kendaraan: DataTypes.STRING,
            tarif: {
                type: DataTypes.INTEGER,
                allowNull: false,
                validate: { min: 0 },
            },
            biaya_kartu: {
                type: DataTypes.INTEGER,
                allowNull: false,
                validate: { min: 0 },
            },
            biaya_ganti_nopol: {
                type: DataTypes.INTEGER,
                allowNull: false,
                validate: { min: 0 },
            },
            status: DataTypes.BOOLEAN,
            user_id: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'produk_member',
        }
    )
    return produk_member
}
