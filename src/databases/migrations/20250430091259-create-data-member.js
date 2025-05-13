'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('data_members', {
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
      akses_tiket: {
        type: Sequelize.BOOLEAN
      },
      akses_kartu: {
        type: Sequelize.BOOLEAN
      },
      no_kartu: {
        type: Sequelize.STRING
      },
      tgl_input: {
        type: Sequelize.DATE
      },
      nama_produk: {
        type: Sequelize.STRING
      },
      tarif: {
        type: Sequelize.STRING
      },
      masa_aktif: {
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
    await queryInterface.dropTable('data_members');
  }
};