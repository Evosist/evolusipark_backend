'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class log_aktivitas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  log_aktivitas.init({
    waktu: DataTypes.DATE,
    jenis: DataTypes.STRING,
    deskripsi: DataTypes.TEXT,
    lokasi: DataTypes.STRING,
    synced: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'log_aktivitas',
  });
  return log_aktivitas;
};