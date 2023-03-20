const { addWishlist, getAllWishlist, deleteWishlist,} = require("../controller/room/wishlist");

const {isAuthenticated } = require("../services/checkUser");

const router = require("express").Router();

router.route("/addwishlist/:id").post(isAuthenticated, addWishlist);
router.route("/deletewishlist/:id").post(isAuthenticated, deleteWishlist);
router.route("/getallwishlist").get(isAuthenticated, getAllWishlist);

module.exports = router;