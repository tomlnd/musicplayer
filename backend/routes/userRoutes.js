var express = require("express");
var router = express.Router();
const jwt = require("../config/jwt");
const userController = require("../controllers/userController");

router.post("/register", userController.register);
router.post("/login", userController.login);

module.exports = router;
