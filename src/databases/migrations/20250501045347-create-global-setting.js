'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('global_settings', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      nama_operator: {
        type: Sequelize.STRING
      },
      email_operator: {
        type: Sequelize.STRING
      },
      no_telp_operator: {
        type: Sequelize.STRING
      },
      no_fax_operator: {
        type: Sequelize.STRING
      },
      alamat_operator: {
        type: Sequelize.STRING
      },
      nama_lokasi: {
        type: Sequelize.STRING
      },
      email_lokasi: {
        type: Sequelize.STRING
      },
      no_telp_lokasi: {
        type: Sequelize.STRING
      },
      no_fax_lokasi: {
        type: Sequelize.STRING
      },
      alamat_lokasi: {
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
    await queryInterface.dropTable('global_settings');
  }
};