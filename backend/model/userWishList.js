const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const UserWishlistSchema = new Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("userWishlist", UserWishlistSchema);
