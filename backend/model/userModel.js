const mongoose = require("mongoose");
const Schema = mongoose.Schema;


const UserSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    lowerCase: true,
    // unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  confirmPassword: {
    type: String,
    required: true,
  },
  profileId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Profile",
  },

  //   role: {
  //     type: String,
  //     enum: ["user", "admin", "company"],
  //     default: "user",
  //   },
});

module.exports = mongoose.model("User", UserSchema);



