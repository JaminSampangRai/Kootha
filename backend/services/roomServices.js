// // const roomServices = require ("../model/product");

// // async function     
// const RoomForm = require('./../model/roomForm');


// // Create a new RoomForm
// async function createRoomForm(req, res, next) {
//     try {
//       const roomForm = new RoomForm(req.body);
//       const newRoomForm = await roomForm.save();
//       res.status(201).json(newRoomForm);
//     } catch (err) {
//       next(err);
//     }
// }


// // Get all RoomForms
// async function getAllRoomForms(req, res, next) {
//     try {
//       const roomForms = await RoomForm.find();
//       res.status(200).json(roomForms);
//     } catch (err) {
//       next(err);
//     }
// }

// // Get a single RoomForm by ID
// async function getRoomFormById(req, res, next) {
//     try {
//       const roomForm = await RoomForm.findById(req.params.id);
//       if (!roomForm) {
//         return res.status(404).json({ message: 'RoomForm not found' });
//       }
//       res.status(200).json(roomForm);
//     } catch (err) {
//       next(err);
//     }
// }

// // Update a RoomForm by ID
// async function updateRoomFormById(req, res, next) {
//     try {
//       const roomForm = await RoomForm.findByIdAndUpdate(req.params.id, req.body, {
//         new: true,
//         runValidators: true
//       });
//       if (!roomForm) {
//         return res.status(404).json({ message: 'RoomForm not found' });
//       }
//       res.status(200).json(roomForm);
//     } catch (err) {
//       next(err);
//     }
// }

// // Delete a RoomForm by ID
// async function deleteRoomFormById(req, res, next) {
//     try {
//       const roomForm = await RoomForm.findByIdAndDelete(req.params.id);
//       if (!roomForm) {
//         return res.status(404).json({ message: 'RoomForm not found' });
//       }
//       res.status(204).json();
//     } catch (err) {
//       next(err);
//     }
// }

// module.exports = {
//     createRoomForm,
//     getAllRoomForms,
//     getRoomFormById,
//     updateRoomFormById,
//     deleteRoomFormById
//   };




