const express = require('express');
const router = express.Router();
const controller = require('../../pets/controllers/provider/establishment.controller');

router.post('/', controller.createEstablishment);

module.exports = router;
