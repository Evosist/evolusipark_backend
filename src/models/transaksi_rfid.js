'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class transaksi_rfid extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  transaksi_rfid.init({
    rfid_tag: DataTypes.STRING,
    waktu_masuk: DataTypes.DATE,
    waktu_keluar: DataTypes.DATE,
    lokasi: DataTypes.STRING,
    dicetak: DataTypes.BOOLEAN,
    vehicle_type: DataTypes.STRING,
    plat_nomor: DataTypes.STRING,
    durasi_parkir: DataTypes.INTEGER,
    biaya: DataTypes.DECIMAL,
    synced: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'transaksi_rfid',
  });
  return transaksi_rfid;
};