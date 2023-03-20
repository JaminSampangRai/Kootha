const profileModel = require("../../model/profileModel");
const User = require ("../../model/userModel");
const Logout = require ("../../model/LogoutModel");

var bcrypt = require("bcryptjs");

exports.Register = async (req, res) => {
    //console.log(req.body);

    const { name, email, password, confirmPassword, role } = req.body;
    if (!name || !email || !password || !confirmPassword) {
        return res.status(400).json({ message: "Please fill all the fields" });
    }

    if (password.toLowerCase() !== confirmPassword.toLowerCase()) {
        return res.status(400).json({ msg: "Password does not match" });
    }

    const emailExist = await User.findOne({ email: email });
    if (emailExist) {
      return res.status(405).json({ msg: "email already exists" });
    }

    try {
        const user = await User.create({
          name,
          email,
          password: bcrypt.hashSync(req.body.password, 8),
          confirmPassword: bcrypt.hashSync(req.body.confirmPassword, 8),
          // role,
        });
    
        const profile = await profileModel.create({ userId: user.id });
        user.profileId = profile.id;
        await user.save();
    
        res.status(200).json({
          status: 200,
          msg: "User registered successfully",
          user: user,
        });
      } catch (error) {
        console.log(error);
        res.status(500).json({
          msg: "Error occured",
          error: error,
        });
      }   
 };

 exports.Login = async (req, res) => { 
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ msg: "Please fill all the empty fields" });
    }
    try {
        const user = await User.findOne({ email: email });
    
        if (!user) {
          return res.status(400).json({ msg: "User not found" });
        }
        if (bcrypt.compareSync(req.body.password, user.password)) {
          const token = user.id;
          //   res.set("Set-Cookie", `token=${token}; Max-Age=60;`);
          // res.cookie("token", user.id);
          res.status(200).json({
            status: 200,
            msg: "User logged in successfully",
            user: user,
            token,
          });
        }
      } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: "Error occured", error: error });
      }
 };

 
exports.Logout = (req, res) => {
    const authHeader = req.headers["x-access-token"];
  
    Logout.create({
      jwtToken: authHeader,
    })
      .then((result) => {
        console.log(result);
        res.status(200).send({
          message: "User has been Logout",
        });
      })
      .catch((err) => {
        res.status(500).send({
          message: "Something went wrong! Not logout",
        });
      });
  };
  



