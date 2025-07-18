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
            'level_penggunas',
            [
                {
                    id: 2,
                    nama: 'Super Administrator',
                    hak_akses: JSON.stringify([
                        {
                            nama_menu: 'Dashboard',
                            nama_sub_menu: null,
                            aksi: {
                                create: true,
                                read: true,
                                update: true,
                                delete: true,
                            },
                        },
                        {
                            nama_menu: 'Master',
                            nama_sub_menu: [
                                {
                                    nama: 'User',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Level Akses',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                        konfigurasi_menu: true,
                                    },
                                },
                                {
                                    nama: 'Produk Member',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Produk Voucher',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Data Member',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                        perpanjang: true,
                                        ganti_kartu: true,
                                        ganti_nopol: true,
                                    },
                                },
                                {
                                    nama: 'Data Voucher',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'POS',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Kendaraan',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Shift',
                                    aksi: {
                                        create: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Perusahaan',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                            ],
                        },
                        {
                            nama_menu: 'Setting',
                            nama_sub_menu: [
                                {
                                    nama: 'Tarif Parkir',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Tarif Denda',
                                    aksi: {
                                        create: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                                {
                                    nama: 'Parameter',
                                    aksi: { read: true, update: true },
                                },
                                {
                                    nama: 'Global',
                                    aksi: { read: true, update: true },
                                },
                                {
                                    nama: 'Payment',
                                    aksi: { read: true, update: true },
                                },
                            ],
                        },
                        {
                            nama_menu: 'Transaksi',
                            nama_sub_menu: [
                                { nama: 'Manual mix', aksi: null },
                                { nama: 'Pembatalan Transaksi', aksi: null },
                                {
                                    nama: 'Permasalahan atau Perbaikan',
                                    aksi: {
                                        create_permasalahan: true,
                                        create_perbaikan: true,
                                        read: true,
                                        update: true,
                                        delete: true,
                                    },
                                },
                            ],
                        },
                        {
                            nama_menu: 'Report',
                            nama_sub_menu: [
                                { nama: 'Kendaraan', aksi: null },
                                { nama: 'Overnight', aksi: null },
                                { nama: 'Pendapatan Parkir', aksi: null },
                                { nama: 'Pendapatan Gabungan', aksi: null },
                                { nama: 'Pendapatan Member', aksi: null },
                                { nama: 'Pendapatan Voucher', aksi: null },
                                { nama: 'Pembatalan Transaksi', aksi: null },
                                { nama: 'Audit Transaksi', aksi: null },
                                { nama: 'Settlement Cashless', aksi: null },
                            ],
                        },
                    ]),
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
