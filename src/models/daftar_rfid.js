'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class daftar_rfid extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  daftar_rfid.init({
    rfid_tag: DataTypes.STRING,
    nama: DataTypes.STRING,
    no_plat: DataTypes.STRING,
    tanggal_daftar: DataTypes.DATE,
    tanggal_mulai: DataTypes.DATE,
    tanggal_akhir: DataTypes.DATE,
    status: DataTypes.STRING,
    synced: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'daftar_rfid',
  });
  return daftar_rfid;
};