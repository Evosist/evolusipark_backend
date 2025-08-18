const dayjs = require('dayjs')
const utc = require('dayjs/plugin/utc')
dayjs.extend(utc)

const { isValidDDMMYYYY, convertDDMMYYYYtoMMDDYYYY } = require('./dateformat.helper')

function getUTCDateRange(startDate, endDate) {
    if (!isValidDDMMYYYY(startDate) || !isValidDDMMYYYY(endDate)) {
        throw new Error('Format tanggal harus DD-MM-YYYY')
    }

    const startConverted = convertDDMMYYYYtoMMDDYYYY(startDate)
    const endConverted = convertDDMMYYYYtoMMDDYYYY(endDate)

    const start = dayjs.utc(startConverted, 'MM-DD-YYYY').startOf('day').toDate()
    const end = dayjs.utc(endConverted, 'MM-DD-YYYY').endOf('day').toDate()

    if (isNaN(start.getTime()) || isNaN(end.getTime())) {
        throw new Error('Tanggal tidak valid setelah konversi')
    }

    return { start, end }
}

module.exports = { getUTCDateRange }
