const mongoose = require("mongoose");
const Schema = mongoose.Schema;

//schema for booking
const BookingSchema = new Schema(
  {
    checkIn: {
      type: String,
    },
    checkOut: {
      type: String,
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

module.exports = mongoose.model("booking", BookingSchema);
