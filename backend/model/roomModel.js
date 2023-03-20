const mongoose = require("mongoose");
const schema = mongoose.Schema;

const RoomSchema = new schema(
  {
    images: { type: Array || String, required: true },
    price: {
      type: Number,
      required: true,
    },
    contact: {
      type: String,
      required: true,
    },
    priceType: {
      type: String,
      required: true,
      enum: ["Fix", "Negotiable"],
    },
    roomDescription: {
      type: String,
      required: true,
      maxlength: [80, "description cannot exceed 80 characters"],
    },
    parkingType: {
      type: String,
      enum: ["2 wheelers", "4 wheelers", "both"],
      required: true,
    },
    roomQuantity: {
      type: String,
      enum: ["one", "two"],
      required: true,
    },
    roomSize: {
      type: String,
      // required: true,
    },
    waterFacilities: {
      type: String,
      enum: ["once a day", "twice a day", "everytime"],
      // required: true,
    },
    latitude: {
      type: Number,
      // required: true,
    },
    longitude: {
      type: Number,
      // required: true,
    },
    street: {
      type: String,
      // required: true,
    },
    address: {
      type: String,
      required: true,
    },
    wifi: {
      type: Boolean,
      default: false,
    },
    water: {
      type: Boolean,
      default: false,
    },
    park: {
      type: Boolean,
      default: false,
    },
    kitchen: {
      type: Boolean,
      default: false,
    },
    bed: {
      type: Boolean,
      default: false,
    },
    isBooked: {
      type: Boolean,
      default: false,
    },
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("RoomForm", RoomSchema);







// const mongoose = require("mongoose");
// // const Joi = require('joi');

// const schema = mongoose.Schema;

// const RoomSchema = new schema(
//   {
//     images: { type: Array , required: true },
//     city: {
//         type: String,
//         required: true,
//       },
    
//     price: {
//       type: Number,
//       required: true,
//     },
//     street: {
//         type: String,
//         required: true,
//       },

//     priceType: {
//         type: String,
//         required: true,
//         enum: ["fix", "negotiable"],
//     },
//     water: {
//         type: Boolean,
        
//     },
//     wifi: {
//         type: Boolean,
//     },
//     parking: {
//         type: Boolean,

//     },
//     kitchen:{
//         type: Boolean,
//     },
//     electricity: {
//         type: Boolean,
//     },
//     contact: {
//       type: String,
//       required: true,
//     },
//     roomDescription: {
//       type: String,
//       required: true,
//       maxlength: [80, 'description cannot exceed 80 characters'],
//     },
//     parkingType: {
//       type: String,
//       enum: ["2 wheelers", "4 wheelers", "both"],
//     },
//     roomQuantity: {
//       type: String,
//       enum: ["One", "two"],
//     },
//     age: {
//       type: Number,
//     },
//     gender: {
//       type: String,
//       enum: ["Male", "Female"],
//     },
//     budget: {
//       type: Number,
//     },
//     profession: {
//       type: String,
//     },
//     userDescription: {
//       type: String,
      
//     },
//     profilepic: {
//         type: String,
//     }
//   },
//   {
//     timestamps: true,
//   }
// );

// module.exports = mongoose.model("allroomform", RoomSchema);
