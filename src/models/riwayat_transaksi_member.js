'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class riwayat_transaksi_member extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            riwayat_transaksi_member.belongsTo(models.produk_member, {
                foreignKey: 'produk_id',
                as: 'produk_member',
            })

            riwayat_transaksi_member.belongsTo(models.user, {
                foreignKey: 'user_id',
                as: 'user',
            })
        }
    }
    riwayat_transaksi_member.init(
        {
            tgl_transaksi: DataTypes.DATE,
            produk_id: DataTypes.INTEGER,
            tarif: {
                type: DataTypes.INTEGER,
                allowNull: false,
                validate: { min: 0 },
            },
            masa_aktif: DataTypes.ARRAY(DataTypes.STRING),
            user_id: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'riwayat_transaksi_member',
        }
    )
    return riwayat_transaksi_member
}
