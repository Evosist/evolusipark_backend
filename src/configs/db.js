const pg = require('pg')

const envPath = `.env.${process.env.NODE_ENV || 'development'}`
require('dotenv').config({ path: envPath })

module.exports = {
    development: {
        username: process.env.DB_USERNAME,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialect: 'postgres',
        dialectModule: pg,
<<<<<<< HEAD
        logging: false
        // ⚠️ Hilangkan dialectOptions jika PostgreSQL tidak pakai SSL
    }
=======
        logging: false,
    },
    staging: {
        username: process.env.DB_USERNAME,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialect: 'postgres',
        dialectModule: pg,
        logging: false,
        dialectOptions: {
            ssl: {
                rejectUnauthorized: false,
            },
        },
    },
    production: {
        username: process.env.DB_USERNAME,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialect: 'postgres',
        dialectModule: pg,
        logging: false,
        dialectOptions: {
            ssl: {
                rejectUnauthorized: false,
            },
        },
    },
>>>>>>> ab960c44f5a6333bc052f7c8c30b99f7a22ae700
}
