'use strict'

/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        /**
         * Add seed commands here.
         *
         * Example:
         * await queryInterface.bulkInsert('People', [{
         *   name: 'John Doe',
         *   isBetaMember: false
         * }], {});
         */

        await queryInterface.bulkInsert(
            'users',
            [
                {
                    nama: 'Evolusi Sistem Digital',
                    jenis_kelamin: 'Laki-laki',
                    no_hp: '0823234234234',
                    alamat_lengkap: 'Jakarta',
                    username: 'evolusisistemdigital',
                    password: 'aksesadmin',
                    perusahaan_id: 1,
                    level_pengguna_id: 1,
                    status: true,
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
