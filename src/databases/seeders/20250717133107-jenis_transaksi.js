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
            'payments',
            [
                {
                    jenis_payment: 'Cash',
                    status: false,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    jenis_payment: 'Prepaid',
                    status: false,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    jenis_payment: 'Transfer Bank',
                    status: false,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    jenis_payment: 'E-Wallet',
                    status: false,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    jenis_payment: 'Member',
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
