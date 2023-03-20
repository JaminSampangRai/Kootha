const mongoose = require("mongoose");
const Schema = mongoose.Schema;


const RatingSchema = new Schema(
  {
    rating: {
      type: String,
      required: true,
    },
    review: {
      type: String,
      required: true,
    },
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

module.exports = mongoose.model("rating", RatingSchema);
