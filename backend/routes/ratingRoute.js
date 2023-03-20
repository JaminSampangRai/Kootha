const { addRating, getAllRating } = require("../controller/room/rating");
const { isAuthenticated } = require("../services/checkUser");

const router = require("express").Router();

router.route("/add-rating/:id").post(isAuthenticated, addRating);

router.route("/get-all-rating/:id").get(isAuthenticated, getAllRating);
module.exports = router;