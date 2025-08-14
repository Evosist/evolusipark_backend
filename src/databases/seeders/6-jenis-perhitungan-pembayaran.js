'use strict'

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        /**
         * Add seed commands here.
         *
         * Example:
         *
         */

        await queryInterface.bulkInsert(
            'jenis_perhitungan_pembayarans',
            [
                {
                    nama: 'Regular',
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    nama: 'Flat',
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
            ],
            {}
        )
    },

    async down(queryInterface, Sequelize) {
        /**
         * Add commands to revert seed here.
         *
         * Example:
         * await queryInterface.bulkDelete('People', null, {});
         */
    },
}
