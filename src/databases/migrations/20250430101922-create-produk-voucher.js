'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('produk_vouchers', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      nama: {
        type: Sequelize.STRING
      },
      periode: {
        type: Sequelize.STRING
      },
      kendaraan: {
        type: Sequelize.STRING
      },
      tarif: {
        type: Sequelize.STRING
      },
      model_pembayaran: {
        type: Sequelize.ENUM
      },
      metode_verifikasi: {
        type: Sequelize.ENUM
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
    await queryInterface.dropTable('produk_vouchers');
  }
};