const express = require("express");
const router =  express.Router();
const { ValidateUser, RegisterUser } = require("../controllers/auth");

router.post("/", ValidateUser);
router.post("/register", RegisterUser);

module.exports = router;