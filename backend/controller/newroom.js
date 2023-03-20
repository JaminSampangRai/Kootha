const room = require('./../model/roomModel');



async function newRoom(req, res, next) {
    try {

    const images = req.files['images'].map(file => file.filename);
    const proflieimmg = req.files['profilepic'] [0].filename;

      
      
      const newRoom = new room({
        
        images: images,
        city: req.body.city,
        street: req.body.street,
        price: req.body.price,
        contact: req.body.contact,
        priceType: req.body.priceType,
        roomDescription: req.body.roomDescription,
        parkingType: req.body.parkingType,
        roomQuantity: req.body.roomQuantity,
        water: req.body.water,
        wifi: req.body.wifi,
        parking: req.body.parking,
        kitchen: req.body.kitchen,
        electricity: req.body.electricity,
        age: req.body.age,
        budget: req.body.budget,
        gender: req.body.gender,
        profession: req.body.profession,
        profilepic: proflieimmg,
        userDescription: req.body.userDescription,
      });
  
      await newRoom.save();
      res.status(201).json(newRoom);
    } catch (err) {
      next(err);
    }
  }

  async function getAllRooms(req, res, next) {
    try {
      const rooms = await room.find();
      res.json(rooms);
    } catch (err) {
      next(err);
    }
  }



  async function getRoom(req, res, next) {
    try {
      const room = await roomForm.findById(req.params.id);
      if (!room) {
        return res.status(404).json({ message: "Room not found" });
      }
      res.json(room);
    } catch (err) {
      next(err);
    }
  }



  async function updateRoom(req, res, next) {
    try {
      const room = await roomForm.findByIdAndUpdate(req.params.id, req.body, {
        new: true,
      });
      if (!room) {
        return res.status(404).json({ message: "Room not found" });
      }
      res.json(room);
    } catch (err) {
      next(err);
    }
  }


  async function deleteRoom(req, res, next) {
    try {
      const room = await roomForm.findByIdAndDelete(req.params.id);
      if (!room) {
        return res.status(404).json({ message: "Room not found" });
      }
      res.json({ message: "Room deleted successfully" });
    } catch (err) {
      next(err);
    }
  }

  module.exports = {
    newRoom,
    getRoom,
    updateRoom,
    deleteRoom,
    getAllRooms,
    };











