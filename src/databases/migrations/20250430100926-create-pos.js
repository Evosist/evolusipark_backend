'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('pos', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      kode: {
        type: Sequelize.STRING
      },
      keterangan: {
        type: Sequelize.STRING
      },
      tipe_pos: {
        type: Sequelize.ENUM
      },
      tipe_manless: {
        type: Sequelize.ENUM
      },
      tipe_kendaraan: {
        type: Sequelize.ENUM
      },
      pengaturan_kamera: {
        type: Sequelize.ARRAY
      },
      nama_printer: {
        type: Sequelize.STRING
      },
      nama_interface: {
        type: Sequelize.STRING
      },
      com_port: {
        type: Sequelize.STRING
      },
      synchronize: {
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
    await queryInterface.dropTable('pos');
  }
};