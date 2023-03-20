const mongoose = require("mongoose");

const MessageSchema = mongoose.Schema(
  {
    message: {
      text: { type: String, required: true },
    },
    users: Array,
    sender: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    receiver: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    conversationId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "conversation",
    },
  },

  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Messages", MessageSchema);
