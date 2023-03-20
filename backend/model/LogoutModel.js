const mongoose = require("mongoose");
const Schema = mongoose.Schema;


const LogoutSchema = new Schema(
  {
    token: {
      type: String,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Logout", LogoutSchema);
