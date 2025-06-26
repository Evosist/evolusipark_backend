'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class laporan_data_settlement_cashless_section extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            laporan_data_settlement_cashless_section.belongsTo(models.pos, {
                foreignKey: 'pintu_keluar_id',
                as: 'pintu_keluar',
            })

            laporan_data_settlement_cashless_section.belongsTo(
                models.kendaraan,
                {
                    foreignKey: 'kendaraan_id',
                    as: 'kendaraan',
                }
            )

            laporan_data_settlement_cashless_section.belongsTo(models.user, {
                foreignKey: 'petugas_id',
                as: 'petugas',
            })

            laporan_data_settlement_cashless_section.belongsTo(models.shift, {
                foreignKey: 'shift_id',
                as: 'shift',
            })
        }
    }
    laporan_data_settlement_cashless_section.init(
        {
            no: DataTypes.INTEGER,
            no_tiket: DataTypes.STRING,
            tanggal_keluar: DataTypes.DATE,
            pintu_keluar_id: DataTypes.INTEGER,
            nopol: DataTypes.STRING,
            kendaraan_id: DataTypes.INTEGER,
            interval: DataTypes.STRING,
            tarif: DataTypes.INTEGER,
            denda: DataTypes.INTEGER,
            tipe_denda: DataTypes.STRING,
            pembayaran: DataTypes.STRING,
            channel: DataTypes.STRING,
            va_qr: DataTypes.STRING,
            petugas_id: DataTypes.INTEGER,
            shift_id: DataTypes.INTEGER,
            transaction_id: DataTypes.STRING,
            order_id: DataTypes.STRING,
            transaction_time: DataTypes.STRING,
            settlement_time: DataTypes.STRING,
            settlement_status: DataTypes.STRING,
            file_settlement_nama: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'laporan_data_settlement_cashless_section',
        }
    )
    return laporan_data_settlement_cashless_section
}
