'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('transaksi_manual_mixes', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      is_manual: {
        type: Sequelize.BOOLEAN
      },
      tanggal_masuk: {
        type: Sequelize.DATE
      },
      pintu_masuk_id: {
        type: Sequelize.INTEGER
      },
      no_tiket_atau_tiket_manual: {
        type: Sequelize.STRING
      },
      kendaraan_id: {
        type: Sequelize.INTEGER
      },
      nomor_polisi: {
        type: Sequelize.STRING
      },
      pintu_keluar_id: {
        type: Sequelize.INTEGER
      },
      tanggal_keluar: {
        type: Sequelize.DATE
      },
      petugas_id: {
        type: Sequelize.INTEGER
      },
      shift_id: {
        type: Sequelize.INTEGER
      },
      denda: {
        type: Sequelize.BOOLEAN
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
    await queryInterface.dropTable('transaksi_manual_mixes');
  }
};