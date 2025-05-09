const express = require('express');
const router = express.Router();
const petsController = require('../../pets/controllers/pets/petsController')
const passport = require("passport");

router
    .post('/', passport.authenticate("jwt", { session: false }), petsController.addPet)
    