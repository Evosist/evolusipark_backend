'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('produk_members', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING
      },
      periode: {
        type: Sequelize.STRING
      },
      kendaraan: {
        type: Sequelize.ARRAY
      },
      max_kendaraan: {
        type: Sequelize.STRING
      },
      tarif: {
        type: Sequelize.STRING
      },
      biaya_kartu: {
        type: Sequelize.STRING
      },
      biaya_ganti_nopol: {
        type: Sequelize.STRING
      },
      status: {
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
    await queryInterface.dropTable('produk_members');
  }
};