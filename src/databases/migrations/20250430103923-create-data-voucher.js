'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('data_vouchers', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      produk_voucher_id: {
        type: Sequelize.INTEGER
      },
      periode: {
        type: Sequelize.STRING
      },
      awal_aktif: {
        type: Sequelize.STRING
      },
      akhir_aktif: {
        type: Sequelize.STRING
      },
      tarif: {
        type: Sequelize.STRING
      },
      model_bayar: {
        type: Sequelize.ENUM
      },
      verifikasi: {
        type: Sequelize.ENUM
      },
      no_tiket_atau_nopol: {
        type: Sequelize.STRING
      },
      kendaraan_id: {
        type: Sequelize.INTEGER
      },
      keterangan: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('data_vouchers');
  }
};