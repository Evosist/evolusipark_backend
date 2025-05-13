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
            periode: DataTypes.STRING,
            kendaraan_mb: DataTypes.BOOLEAN,
            kendaraan_mt: DataTypes.BOOLEAN,
            kendaraan_truck_atau_box: DataTypes.BOOLEAN,
            max_kendaraan: DataTypes.STRING,
            tarif: DataTypes.STRING,
            biaya_kartu: DataTypes.STRING,
            biaya_ganti_nopol: DataTypes.STRING,
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
