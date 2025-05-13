'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('permasalahan_atau_perbaikans', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      judul_permasalahan: {
        type: Sequelize.STRING
      },
      tanggal_permasalahan: {
        type: Sequelize.STRING
      },
      kategori_permasalahan: {
        type: Sequelize.ENUM
      },
      pos_id: {
        type: Sequelize.INTEGER
      },
      hardware_atau_alat: {
        type: Sequelize.STRING
      },
      penyebab_permasalahan: {
        type: Sequelize.TEXT
      },
      keterangan_permasalahan: {
        type: Sequelize.TEXT
      },
      nama_pelapor: {
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
    await queryInterface.dropTable('permasalahan_atau_perbaikans');
  }
};