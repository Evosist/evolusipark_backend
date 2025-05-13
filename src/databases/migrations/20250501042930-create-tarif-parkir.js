'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('tarif_parkirs', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      kendaraan_id: {
        type: Sequelize.INTEGER
      },
      grace_period: {
        type: Sequelize.STRING
      },
      tarif_grace_period: {
        type: Sequelize.STRING
      },
      rotasi_pertama: {
        type: Sequelize.STRING
      },
      tarif_rotasi_pertama: {
        type: Sequelize.STRING
      },
      rotasi_kedua: {
        type: Sequelize.STRING
      },
      tarif_rotasi_kedua: {
        type: Sequelize.STRING
      },
      rotasi_ketiga: {
        type: Sequelize.STRING
      },
      tarif_rotasi_ketiga: {
        type: Sequelize.STRING
      },
      tarif_maksimal: {
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
    await queryInterface.dropTable('tarif_parkirs');
  }
};