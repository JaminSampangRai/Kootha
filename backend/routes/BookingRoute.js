const {
    addBooking,
    getAllBooking,
    getUserBooking,
} = require("../controller/room/booking");
const { isAuthenticated } = require("../services/checkUser");
const { route } = require("./signupRoute");
const router = require("express").Router();

router.route("/add-booking/:id").post(isAuthenticated, addBooking);

router.route("/get-booking").get(getAllBooking);

router.route("get-user-booking").get(isAuthenticated, getUserBooking);

module.exports = router;