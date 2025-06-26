'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class laporan_transaksi_batal extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            laporan_transaksi_batal.belongsTo(models.kendaraan, {
                foreignKey: 'jenis_kendaraan_id',
                as: 'jenis_kendaraan',
            })

            laporan_transaksi_batal.belongsTo(models.pos, {
                foreignKey: 'gerbang_masuk_id',
                as: 'gerbang_masuk',
            })

            laporan_transaksi_batal.belongsTo(models.pos, {
                foreignKey: 'gerbang_keluar_id',
                as: 'gerbang_keluar',
            })

            laporan_transaksi_batal.belongsTo(models.user, {
                foreignKey: 'petugas_id',
                as: 'petugas',
            })

            laporan_transaksi_batal.belongsTo(models.shift, {
                foreignKey: 'shift_id',
                as: 'shift',
            })
        }
    }
    laporan_transaksi_batal.init(
        {
            no: DataTypes.INTEGER,
            nomor_tiket: DataTypes.STRING,
            nomor_polisi: DataTypes.STRING,
            jenis_kendaraan_id: DataTypes.INTEGER,
            member: DataTypes.BOOLEAN,
            manual_input: DataTypes.BOOLEAN,
            waktu_masuk: DataTypes.DATE,
            waktu_keluar: DataTypes.DATE,
            gerbang_masuk_id: DataTypes.INTEGER,
            gerbang_keluar_id: DataTypes.INTEGER,
            durasi_parkir: DataTypes.STRING,
            denda: DataTypes.STRING,
            total_pembayaran: DataTypes.STRING,
            status: DataTypes.BOOLEAN,
            tipe: DataTypes.STRING,
            pembayaran: DataTypes.STRING,
            kartu_member: DataTypes.BOOLEAN,
            nama_bank: DataTypes.STRING,
            nomor_rekening: DataTypes.STRING,
            nama_e_wallet: DataTypes.STRING,
            nomor_e_wallet: DataTypes.STRING,
            petugas_id: DataTypes.INTEGER,
            shift_id: DataTypes.INTEGER,
            foto: DataTypes.STRING,
            aksi: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'laporan_transaksi_batal',
        }
    )
    return laporan_transaksi_batal
}
