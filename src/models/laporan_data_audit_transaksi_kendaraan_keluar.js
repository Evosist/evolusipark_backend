'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class laporan_data_audit_transaksi_kendaraan_keluar extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            laporan_data_audit_transaksi_kendaraan_keluar.belongsTo(
                models.transaksi_manual,
                { foreignKey: 'id_transaksi', as: 'transaksi_manual' }
            )

            laporan_data_audit_transaksi_kendaraan_keluar.belongsTo(
                models.transaksi_tunai,
                { foreignKey: 'id_transaksi', as: 'transaksi_tunai' }
            )
        }
    }
    laporan_data_audit_transaksi_kendaraan_keluar.init(
        {
            no: DataTypes.INTEGER,
            tanggal: DataTypes.DATE,
            kategori: DataTypes.STRING,
            id_transaksi: DataTypes.INTEGER,
            nopol: DataTypes.STRING,
            nama_member: DataTypes.STRING,
            tarif_asli: DataTypes.STRING,
            nama_voucher: DataTypes.STRING,
            potongan_voucher: DataTypes.STRING,
            tarif_dibayar: DataTypes.STRING,
            pembayaran: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'laporan_data_audit_transaksi_kendaraan_keluar',
        }
    )
    return laporan_data_audit_transaksi_kendaraan_keluar
}
