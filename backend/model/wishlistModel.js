const mongoose = require("mongoose");
const Schema = mongoose.Schema;


const WishlistSchema = new Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    roomId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "RoomForm",
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("wishlist", WishlistSchema);
