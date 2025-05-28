'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class pos extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            pos.belongsTo(models.user, { foreignKey: 'user_id', as: 'user' })
        }
    }
    pos.init(
        {
            kode: DataTypes.STRING,
            keterangan: DataTypes.STRING,
            tipe_pos: DataTypes.ENUM('In', 'Out'),
            tipe_manless: DataTypes.ENUM(
                'Loop 1 with Button',
                'Loop 1 with Button and Feedback',
                'Feedback with Button',
                'Button Only'
            ),
            tipe_kendaraan: DataTypes.ENUM('Mobil', 'Motor', 'All'),
            kamera_1: DataTypes.BOOLEAN,
            kamera_2: DataTypes.BOOLEAN,
            nama_printer: DataTypes.ENUM(
                'Epson TM-T81 Receipt',
                'Epson TM-T82 Receipt',
                'Epson TM-U220 Receipt',
                'Epson TM-T88III Receipt',
                'Epson TM-T88IV Receipt',
                'Epson TM-T88V Receipt',
                'Epson TM-T82II Receipt'
            ),
            nama_interface: DataTypes.ENUM(
                'BGI',
                'TWS',
                'PAWL',
                'SMART PARKING',
                'SER TELINKS',
                'USB TELINKS'
            ),
            com_port: DataTypes.STRING,
            otorisasi: DataTypes.BOOLEAN,
            synchronize: DataTypes.STRING,
            user_id: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'pos',
        }
    )
    return pos
}
