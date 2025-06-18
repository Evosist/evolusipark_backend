const aktivitasGerbangKendaraanRouter = require('express').Router()
const aktivitasGerbangKendaraanController = require('../../controllers/dashboard/aktivitas-gerbang-kendaraan.controller')

aktivitasGerbangKendaraanRouter.get(
    '/',
    aktivitasGerbangKendaraanController.getAll
)
aktivitasGerbangKendaraanRouter.get(
    '/:id',
    aktivitasGerbangKendaraanController.findOneById
)
aktivitasGerbangKendaraanRouter.post(
    '/',
    aktivitasGerbangKendaraanController.create
)
aktivitasGerbangKendaraanRouter.patch(
    '/:id',
    aktivitasGerbangKendaraanController.update
)
aktivitasGerbangKendaraanRouter.delete(
    '/:id',
    aktivitasGerbangKendaraanController.delete
)

module.exports = aktivitasGerbangKendaraanRouter
