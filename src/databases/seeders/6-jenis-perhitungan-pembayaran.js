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
            'jenis_perhitungan_pembayaran',
            [
                {
                    jenis_payment: 'Regular',
                    status: false,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    jenis_payment: 'Flat',
                    status: false,
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
