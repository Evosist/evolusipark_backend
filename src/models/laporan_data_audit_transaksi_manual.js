'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class laporan_data_audit_transaksi_manual extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            laporan_data_audit_transaksi_manual.belongsTo(models.pos, {
                foreignKey: 'pos_id',
                as: 'pos_id',
            })

            laporan_data_audit_transaksi_manual.belongsTo(models.user, {
                foreignKey: 'nama_petugas_id',
                as: 'petugas',
            })
        }
    }
    laporan_data_audit_transaksi_manual.init(
        {
            no: DataTypes.INTEGER,
            pos_id: DataTypes.INTEGER,
            nama_petugas_id: DataTypes.INTEGER,
            qty_transaksi: DataTypes.INTEGER,
            total_nominal: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'laporan_data_audit_transaksi_manual',
        }
    )
    return laporan_data_audit_transaksi_manual
}
