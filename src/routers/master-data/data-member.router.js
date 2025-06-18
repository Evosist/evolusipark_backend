const dataMemberRouter = require('express').Router()
const dataMemberController = require('../../controllers/master-data/data-member.controller')

dataMemberRouter.get('/', dataMemberController.getAll)
dataMemberRouter.get(
    '/riwayat-transaksi-ganti-nopol',
    dataMemberController.getRiwayatTransaksiGantiNopol
)
dataMemberRouter.get(
    '/riwayat-transaksi-kartu-member',
    dataMemberController.getRiwayatTransaksiKartuMember
)
dataMemberRouter.get(
    '/riwayat-transaksi-member',
    dataMemberController.getRiwayatTransaksiMember
)
dataMemberRouter.get('/pdf', dataMemberController.generatePdf)
dataMemberRouter.get('/excel', dataMemberController.generateExcel)
dataMemberRouter.get('/:id', dataMemberController.findOneById)
dataMemberRouter.post('/', dataMemberController.create)
dataMemberRouter.patch(
    '/perpanjang-masa-aktif/:id',
    dataMemberController.perpanjangMasaAktif
)
dataMemberRouter.patch('/ganti-nopol/:id', dataMemberController.gantiNopol)
dataMemberRouter.patch('/ganti-kartu/:id', dataMemberController.gantiKartu)
dataMemberRouter.patch('/:id', dataMemberController.update)
dataMemberRouter.delete('/:id', dataMemberController.delete)

module.exports = dataMemberRouter
