'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class laporan_data_audit_transaksi_pembatalan_transaksi extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            laporan_data_audit_transaksi_pembatalan_transaksi.belongsTo(
                models.pos,
                {
                    foreignKey: 'pos_id',
                    as: 'pos',
                }
            )

            laporan_data_audit_transaksi_pembatalan_transaksi.belongsTo(
                models.user,
                {
                    foreignKey: 'petugas_id',
                    as: 'petugas',
                }
            )
        }
    }
    laporan_data_audit_transaksi_pembatalan_transaksi.init(
        {
            no: DataTypes.INTEGER,
            pos_id: DataTypes.INTEGER,
            petugas_id: DataTypes.INTEGER,
            qty: DataTypes.INTEGER,
            total_nominal: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'laporan_data_audit_transaksi_pembatalan_transaksi',
        }
    )
    return laporan_data_audit_transaksi_pembatalan_transaksi
}
