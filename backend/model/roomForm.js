// const mongoose = require("mongoose");
// // const Joi = require('joi');

// const schema = mongoose.Schema;

// const RoomSchema = new schema(
//   {
//     images: { type: Array, required: true },
//     price: {
//       type: Number,
//       required: true,
//     },
//     contact: {
//       type: String,
//       required: true,
//     },
//     priceType: {
//       type: String,
//       required: true,
//       enum: ["fix", "negotiable"],
//     },
//     roomDescription: {
//       type: String,
//       required: true,
//       maxlength: [80, 'description cannot exceed 80 characters'],
//     },
//     parkingType: {
//       type: String,
//       enum: ["2 wheelers", "4 wheelers", "both"],
//       required: true,
//     },
//     roomQuantity: {
//       type: String,
//       enum: ["One", "two"],
//       required: true,
//     },
//     street: {
//       type: String,
//       required: true,
//     },
//     latitude: {
//       type: Number,
//       required: true,
//     },
//     longitude: {
//       type: Number,
//       required: true,
//     },
//     address: {
//       type: String,
//       required: true,
//     },
//     city: {
//       type: String,
//       required: true,
//     },
//     state: {
//       type: String,
//       required: true,
//     },
//     country: {
//       type: String,
//       required: true,
//     },
//     postalCode: {
//       type: String,
//       required: true,
//     },
//   },
//   {
//     timestamps: true,
//   }
// );

// module.exports = mongoose.model("RoomForm", RoomSchema);
