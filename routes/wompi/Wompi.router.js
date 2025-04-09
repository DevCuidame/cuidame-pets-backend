const express = require("express");
const router = express.Router();
const wompiController  = require("../../pets/controllers/wompi/wompiController");

router.post("", wompiController.encryptData);

module.exports = router;
