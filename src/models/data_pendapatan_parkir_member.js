'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class data_pendapatan_parkir_member extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            data_pendapatan_parkir_member.belongsTo(models.data_member, {
                foreignKey: 'nama_member_id',
                as: 'member',
            })
        }
    }
    data_pendapatan_parkir_member.init(
        {
            no: DataTypes.INTEGER,
            tanggal: DataTypes.DATE,
            kategori: DataTypes.STRING,
            id_transaksi: DataTypes.STRING,
            nopol: DataTypes.STRING,
            nama_member_id: DataTypes.INTEGER,
            tarif_asli: DataTypes.STRING,
            nama_voucher: DataTypes.STRING,
            potongan_voucher: DataTypes.STRING,
            tarif_dibayar: DataTypes.STRING,
            pembayaran: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'data_pendapatan_parkir_member',
        }
    )
    return data_pendapatan_parkir_member
}
