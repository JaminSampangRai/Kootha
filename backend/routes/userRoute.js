const { Register, Login, Logout } = require("../controller/auth/auth");

const router = require("express").Router();

router.route("/register").post(Register);

router.route("/login").post(Login);

router.route("/logout").get(Logout);

module.exports = router;

