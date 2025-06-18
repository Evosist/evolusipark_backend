'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class tiket_manual extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  tiket_manual.init({
    barcode: DataTypes.STRING,
    jenis_pembayaran: DataTypes.STRING,
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
    modelName: 'tiket_manual',
  });
  return tiket_manual;
};