const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const ProfileSchema = new Schema({
  about: {
    type: String,
    default: null,
  },
  image: {
    type: String,
    default: null,
  },
  address: {
    type: String,
    default: null,
  },
  budget: {
    type: String,
    default: null,
  },
  phone: {
    type: String,
    default: null,
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
});

module.exports = mongoose.model("Profile", ProfileSchema);
