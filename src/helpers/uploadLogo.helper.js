'use strict'
const multer = require('multer')
const path = require('path')
const fs = require('fs')

// Konfigurasi storage multer
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    try {
        console.log("Masuk uploadLogo.helper");
      const tenantId = req.tenant_id // dari middleware auth tenant
      if (!tenantId) {
        return cb(new Error('Tenant ID tidak ditemukan dari JWT'), null)
      }

      // lokasi penyimpanan dari root project
      const uploadPath = path.join(process.cwd(), `assets/${tenantId}/images/globals`)

      // bikin folder kalau belum ada
      fs.mkdirSync(uploadPath, { recursive: true })

      cb(null, uploadPath)
    } catch (err) {
      cb(err, null)
    }
  },
  filename: function (req, file, cb) {
    const timestamp = Date.now()
    const ext = path.extname(file.originalname)
    const baseName = path.basename(file.originalname, ext)
    cb(null, `${baseName}_${timestamp}${ext}`)
  },
})

// middleware multer
const uploadLogo = multer({
  storage,
  limits: { fileSize: 2 * 1024 * 1024 }, // optional, max 2MB
  fileFilter: (req, file, cb) => {
    // optional: filter hanya image
    if (!file.mimetype.startsWith('image/')) {
      return cb(new Error('File harus berupa image'), false)
    }
    cb(null, true)
  },
}).single('logo') // field name di form-data = "logo"

module.exports = uploadLogo
