'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class laporan_data_audit_transaksi_penggunaan_voucher extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            laporan_data_audit_transaksi_penggunaan_voucher.belongsTo(
                models.user,
                {
                    foreignKey: 'petugas_id',
                    as: 'petugas',
                }
            )
        }
    }
    laporan_data_audit_transaksi_penggunaan_voucher.init(
        {
            no: DataTypes.INTEGER,
            nama_voucher: DataTypes.STRING,
            potongan: DataTypes.INTEGER,
            petugas_id: DataTypes.INTEGER,
            qty_digunakan: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'laporan_data_audit_transaksi_penggunaan_voucher',
        }
    )
    return laporan_data_audit_transaksi_penggunaan_voucher
}
