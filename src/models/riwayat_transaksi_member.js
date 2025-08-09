module.exports = (sequelize, DataTypes) => {
  const RiwayatTransaksiMember = sequelize.define('riwayat_transaksi_member', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    tgl_transaksi: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    produk_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    tarif: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    masa_aktif: {
      type: DataTypes.ARRAY(DataTypes.STRING), // atau ARRAY jika pakai PostgreSQL
      allowNull: false,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  }, {
    tableName: 'riwayat_transaksi_member',
    timestamps: false,
  });

  return RiwayatTransaksiMember;
};
