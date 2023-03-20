const mongoose = require("mongoose");

const conversationSchema = mongoose.Schema(
  {
    userOne: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    userTwo: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("conversation", conversationSchema);
