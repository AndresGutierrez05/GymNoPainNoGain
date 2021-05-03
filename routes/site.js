const express = require("express");
const router =  express.Router();
const { RegisterSite, GetUsersBySite } = require("../controllers/site");
const { authenticateToken } = require("../utilities/token");

router.post("/", authenticateToken, RegisterSite);
router.get("/getUsersBySite/:idSite", authenticateToken, GetUsersBySite);

module.exports = router;