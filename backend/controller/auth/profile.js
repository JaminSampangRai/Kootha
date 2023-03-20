const profileModel = require("../../model/profileModel");

exports.updateProfile = async (req, res) => {
    console.log(req.file);
    console.log(req.userId);
  
    const { about, address, budget, phone } = req.body;
  
    const image = req.file.filename;
  
    if (!about || !address || !budget || !phone) {
      res.status(400).json({
        status: 400,
        message: "please fill the required filled",
      });
    }
  
    let data = {
      about,
      address,
      budget,
      image,
      phone,
    };
    try {
      await profileModel.updateOne(
        { userId: req.userId },
        {
          ...data,
        }
      );
      res.status(200).json({
        status: 200,
        message: "updated profile successfully",
      });
    } catch (error) {
      res.status(200).json({
        status: 200,
        message: "error occured while adding rating",
      });
    }
  };
  
  exports.getProfile = async (req, res) => {
    const profileDetails = await profileModel.find({ userId: req.userId });
  
    if (profileDetails) {
      res.status(200).json({
        status: 200,
        data: profileDetails,
        message: "profile fetched successfully",
      });
    } else {
      res.status(400).json({
        status: 400,
        message: "error gettings profile",
      });
    }
  };
  
  exports.getAllUser = async (req, res) => {
    const allUser = await profileModel.find().populate("userId");
  
    if (allUser) {
      res.status(200).json({
        status: 200,
        data: allUser,
        message: "profile fetched successfully",
      });
    } else {
      res.status(400).json({
        status: 400,
        message: "error gettings profile",
      });
    }
  };
  