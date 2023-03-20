const Room = require("../../model/roomModel");


exports.addRoom = async (req, res) => {
    console.log(req.body);
    let {
      price,
      contact,
      priceType,
      roomDescription,
      parkingType,
      roomQuantity,
      latitude,
      longitude,
      address,
      street,
      wifi,
  
      roomSize,
      water,
      park,
      kitchen,
      bed,
      waterFacilities,
    } = req.body;
  
    let images = req.files;
    if (
      !price ||
      !contact ||
      !priceType ||
      !roomDescription ||
      !parkingType ||
      !roomQuantity ||
      !latitude ||
      !longitude ||
      !bed ||
      !waterFacilities ||
      !address
    ) {
      return res.status(400).json({ msg: "Please fill all the fields" });
    }
  
    let data = {
      price,
      contact,
      priceType,
      roomDescription,
      parkingType,
      roomQuantity,
      latitude,
      longitude,
      address,
      street,
      images,
      wifi,
      water,
      park,
      kitchen,
      roomSize,
      bed,
      waterFacilities,
      userId: req.userId,
    };
  
    let newRoom = await Room.create({
      ...data,
    });
  
    if (newRoom) {
      res.status(200).json({
        status: 200,
        data: newRoom,
        msg: "successfully added room",
      });
    } else {
      res.status(400).json({
        status: 400,
  
        msg: "Error while adding room",
      });
    }
  };
  
  exports.getAllRoom = async (req, res) => {
    const query = { isBooked: false };
    const allRooms = await Room.find(query);
    if (allRooms) {
      res.status(200).json({
        status: 200,
        data: allRooms,
        msg: "successfully get all room",
      });
    } else {
      res.status(400).json({
        status: 400,
  
        msg: "Error while adding room",
      });
    }
  };
  
  // user alll room which he has posted
  exports.getUserPostRoom = async (req, res) => {
    console.log("function")
    const query = { userId: req.userId };
    const allRooms = await Room.find(query);
    if (allRooms) {
      res.status(200).json({
        status: 200,
        data: allRooms,
        msg: "successfully get all room",
      });
    } else {
      res.status(400).json({
        status: 400,
  
        msg: "Error while adding room",
      });
    }
  };
  
  exports.deleteRoom = async (req, res) => {
    const { id } = req.params;
    const user = await Room.findByIdAndDelete(id);
    res.status(200).json({
      status: 200,
      message: "room deleted successfully",
    });
  };
  
  exports.editRoom = async (req, res) => {
    console.log(req.body, "mee");
    const { id } = req.params;
  
    let {
      price,
      contact,
      priceType,
      roomDescription,
      parkingType,
      roomQuantity,
      latitude,
      longitude,
      address,
      street,
      wifi,
      water,
      park,
      kitchen,
      roomSize,
      bed,
      waterFacilities,
    } = req.body;
  
    let images = req.files;
    // if (
    //   !price ||
    //   !contact ||
    //   !priceType ||
    //   !roomDescription ||
    //   !parkingType ||
    //   !roomQuantity ||
    //   !latitude ||
    //   !longitude ||
    //   !address
    // ) {
    //   return res.status(400).json({ msg: "Please fill all the fields" });
    // }
  
    let data = {
      price,
      contact,
      priceType,
      roomDescription,
      parkingType,
      roomQuantity,
      latitude,
      longitude,
      address,
      street,
      images,
      wifi,
      water,
      park,
      kitchen,
      roomSize,
      bed,
      waterFacilities,
    };
  
    let updateRoom = await Room.findByIdAndUpdate(
      id,
      {
        ...data,
      },
      {
        new: true,
      }
    );
  
    console.log(updateRoom);
  
    if (updateRoom) {
      res.status(200).json({
        status: 200,
        data: updateRoom,
        msg: "successfully updated room",
      });
    } else {
      res.status(400).json({
        status: 400,
        msg: "Error while updatingsss room",
      });
    }
};
  