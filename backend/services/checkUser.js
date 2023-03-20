const User = require("../model/userModel");

exports.isAuthenticated = async (req, res, next) => {
    console.log("middleware");
    const token = req.headers["x-access-token"];
    if (!token) {
      return res.status(401).json({ msg: "No token provided" });
    }
    const user = await User.findById(token);
    if (!user) {
      return res.status(401).json({ msg: "Unauthorized" });
    }
    req.userId = token;
    req.user = user;
    next();
  };