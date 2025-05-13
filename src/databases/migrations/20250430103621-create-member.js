'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('members', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      nama: {
        type: Sequelize.STRING
      },
      no_hp: {
        type: Sequelize.STRING
      },
      perusahaan_id: {
        type: Sequelize.INTEGER
      },
      akses_menggunakan_tiket: {
        type: Sequelize.BOOLEAN
      },
      akses_menggunakan_kartu: {
        type: Sequelize.BOOLEAN
      },
      nomor_kartu: {
        type: Sequelize.INTEGER
      },
      data_nopol: {
        type: Sequelize.JSONB
      },
      produk_id: {
        type: Sequelize.INTEGER
      },
      periode: {
        type: Sequelize.STRING
      },
      tarif_dasar_member: {
        type: Sequelize.STRING
      },
      biaya_member: {
        type: Sequelize.STRING
      },
      biaya_kartu: {
        type: Sequelize.STRING
      },
      awal_aktif: {
        type: Sequelize.DATE
      },
      akhir_aktif: {
        type: Sequelize.DATE
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
    await queryInterface.dropTable('members');
  }
};