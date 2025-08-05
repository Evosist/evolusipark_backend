const pg = require('pg')

require('dotenv').config({ path: '.env' })

module.exports = {
    development: {
        username: process.env.DB_USERNAME,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialect: 'postgres',
        dialectModule: pg,
        logging: false
        // ⚠️ Hilangkan dialectOptions jika PostgreSQL tidak pakai SSL
    }
}
