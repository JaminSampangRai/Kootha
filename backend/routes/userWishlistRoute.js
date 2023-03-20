const { addUserWishlist, getwishlistDetails, deleteUserWishlist,} = require ("../controller/user/wishlist");

const { isAuthenticated } = require ("../services/checkUser");
const router = require("express").Router();

router.route("/adduserwishlist").post(isAuthenticated, addUserWishlist);

router.route("/deleteuserwishlist/:id").post(isAuthenticated, deleteUserWishlist);

router.route("/getuserwishlist").get(isAuthenticated, getwishlistDetails);

module.exports = router;