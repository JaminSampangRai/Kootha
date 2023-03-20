const wishlistModel = require("../../model/wishlistModel");

exports.addWishlist = async (req, res) => {
    const { id } = req.params;
    const userId = req.userId;
  
    let data = {
      roomId: id,
      userId,
    };
  
    const wishlist = await wishlistModel.create({ ...data });
  
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

exports.getAllWishlist = async (req, res) => {
    const wishlistDetails = await wishlistModel.find({userId: req.userId});
    if (wishlistDetails) {
        res.status(200).json({
          status: 200,
          data: wishlistDetails,
          message: "success",
        });
      } else {
        res.status(400).json({
          status: 400,
          message: "error",
        });
    }

};

exports.deleteWishlist = async (req, res) => {
    const wishlistDetails = await wishlistModel.deleteOne({
        roomId: req.params.id,

    });
    if (wishlistDetails) {
        res.status(200).json({
            status: 200,
            message: "room deleted from wishlist successfully",

        });
    } else {
        res.status(400).json({
            status: 400,
            message: "error",
        });
    }
};

  
