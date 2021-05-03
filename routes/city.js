const express = require("express");
const router =  express.Router();
const { RegisterCity } = require("../controllers/city");
const { authenticateToken } = require("../utilities/token");

router.post("/", authenticateToken, RegisterCity);

module.exports = router;