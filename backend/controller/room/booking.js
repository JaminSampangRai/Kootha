const BookingModel = require("../../model/BookingModel");

const roomModel = require("../../model/roomModel");

exports.addBooking = async (req, res) => {
    console.log(req.body, "me");
    const { checkIn, checkOut } = req.body;
  
    if (!checkIn || !checkOut) {
      res.status(400).json({
        status: 400,
        message: "please fill the required filled",
      });
    }
  
    let data = {
      checkIn,
      checkOut,
      roomId: req.params.id,
      userId: req.userId,
    };
    try {
      let bookings = await BookingModel.create({ ...data });
  
      console.log(bookings);
  
      if (bookings) {
        await roomModel.updateOne(
          { _id: req.params.id },
          { $set: { isBooked: true } }
        );
        res.status(200).json({
          status: 200,
          // data: AddRating,
          msg: "booked",
        });
      } else {
        res.status(40).json({
          status: 200,
          // data: AddRating,
          msg: "error",
        });
      }
    } catch (error) {
      res.status(400).json({
        status: 400,
        message: "error occured while adding rating",
      });
    }
};

exports.getAllBooking = async (req, res) => {
    //   console.log(req.params.id, "me");
    const allBooking = await BookingModel.find({ isBooked: false })
      .populate("roomId")
      .populate("userId");
    if (allBooking) {
      res.status(200).json({
        status: 200,
        data: allBooking,
        message: "success",
      });
    } else {
      res.status(400).json({
        status: 400,
        message: "error while fetching rating",
      });
    }
};

// individual booking details of room owner
exports.getUserBooking = async (req, res) => {
    //   console.log(req.params.id, "me");
    const allBooking = await BookingModel.find({ userId: req.userId })
      .populate("roomId")
      .populate("userId");
    if (allBooking) {
      res.status(200).json({
        status: 200,
        data: allBooking,
        message: "success",
      });
    } else {
      res.status(400).json({
        status: 400,
        message: "error while fetching ",
      });
    }
};

//get all booked room
exports.getAllBooked = async (req, res) => {
    // console.log(req.params.id, "me");
    const {id} = req.params.id;
    const allBooking = await BookingModel.find({userId: req.userId})
        .populate("roomId")
        .populate("userId");
    if (allBooking) {
        res.status(200).json({
            status: 200,
            data: allBooking,
            message: "success",
        });
    } else {
        res.status(400).json({
            status: 400,
            message: "error while fetching ",
        });
    }
};


