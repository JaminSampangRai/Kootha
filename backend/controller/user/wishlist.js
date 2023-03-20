const e = require("express");
const userWishlist = require("../../model/userWishList");

exports.addUserWishlist = async (req, res) => {
    const wishlist = await userWishlist.create({ userId: req.userId });
  
    if (wishlist) {
      res.status(200).json({
        status: 200,
        data: wishlist,
        message: "success",
      });
    } else {
      res.status(400).json({
        status: 400,
        message: "error",
      });
    }
};

exports.getwishlistDetails = async (req, res) => {
    console.log();
    //   const { userId } = req.userId;
    const wishlist = await userWishlist
      .find({ userId: req.userId })
      .populate("userId");
  
    if (wishlist) {
      res.status(200).json({
        status: 200,
        data: wishlist,
        message: "success",
      });
    } else {
      res.status(400).json({
        status: 400,
        message: "error",
      });
    }
};

exports.deleteUserWishlist = async (req, res) => {
    const wishlistDetails = await userWishlist.deleteOne({
        _id: req.params.id,
    });
    console.log(wishlistDetails, 'mee');
    if (wishlistDetails) {
        res.status(200).json({
            status: 200,
            message: "roommate is removed from wishlist successfully",
        });
    } else {
        res.status(400).json({
            status: 400,
            message: "error",
        });
    }
};

