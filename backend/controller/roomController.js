const roomServices = require("../services/roomServices");
// const upload = require("../middleware/upload");
const upload = require("../middleware/upload");
const imageUploads = require("../middleware/imageupload");
const roomForm = require("../model/roomForm");
const { validateRoomForm } = require("../middleware/validationroomform");
// const imageUploads = multer({ dest: "uploads/images" });




// async function createRoomForm(req, res, next) {
//   // console.log(req.body)
//   // res.status(200).json({data:req.body})
//   try {
//     console.log(req.body)
//     imageUploads(req, res, async function(err) {
//       if (err) {
//         return res.status(400).json({ message: err.message });    
//       }
//       // const url = req.protocol + "://" + req.get("host");
//       // const images = req.files.map((files) => url + "/" + files.path);
//       console.log(req.files)
      
//       // const newRoomForm = new roomForm({
//       //   images: images,
//       //   city: req.body.city,
//       //   street: req.body.street,
//       //   price: req.body.price,
//       //   contact: req.body.contact,
//       //   priceType: req.body.priceType,
//       //   roomDescription: req.body.roomDescription,
//       //   parkingType: req.body.parkingType,
//       //   roomQuantity: req.body.roomQuantity,
//       //   latitude: req.body.latitude,
//       //   longitude: req.body.longitude,
//       //   address: req.body.address,
//       //   state: req.body.state,
//       //   country: req.body.country,
//       //   postalCode: req.body.postalCode,
//       // });

//       // await newRoomForm.save();
//       // res.status(201).json(newRoomForm);
//     });
//   } catch (err){
//     next(err);
//   }
// }


async function createRoomForm(req, res, next) {
  try {
    console.log(req.body);
    console.log(req);
    const images = req.files.map(file => file.filename);
    
    const newRoomForm = new roomForm({

      // images: req.body.images,
      // images:req.files,
      images: images,
      city: req.body.city,
      street: req.body.street,
      price: req.body.price,
      contact: req.body.contact,
      priceType: req.body.priceType,
      roomDescription: req.body.roomDescription,
      parkingType: req.body.parkingType,
      roomQuantity: req.body.roomQuantity,
      latitude: req.body.latitude,
      longitude: req.body.longitude,
      address: req.body.address,
      state: req.body.state,
      country: req.body.country,
      postalCode: req.body.postalCode,
    });

    await newRoomForm.save();
    res.status(201).json(newRoomForm);
  } catch (err) {
    next(err);
  }
}


// async function createRoomForm(req, res, next) {
//   console.log(req.body)
//   // res.status(200).json({data:req.body})
//   try {
//     validateRoomForm(req, res, function (err) {
//       if (err) {
//         return res.status(400).json({message:err.message});
//       }
//        upload(req, res, async function(err) {
//         if (err) {
//           return res.status(400).json({ message: err.message });    
//         }
//         const url = req.protocol + "://" + req.get("host");
//         const images = req.files.map((file) => url + "/" + file.path);
        
//         const newRoomForm = new roomForm({
          
//           // images: images,
//           // city: req.body.city,
//           // street: req.body.street,
//           // price: req.body.price,
//           // contact: req.body.contact,
//           // priceType: req.body.priceType,
//           // roomDescription: req.body.roomDescription,
//           // parkingType: req.body.parkingType,
//           // roomQuantity: req.body.roomQuantity,
//           // location: req.body.location
//           images: images,
//           city: req.body.city,
//           street: req.body.street,
//           price: req.body.price,
//           contact: req.body.contact,
//           priceType: req.body.priceType,
//           roomDescription: req.body.roomDescription,
//           parkingType: req.body.parkingType,
//           roomQuantity: req.body.roomQuantity,
//           latitude: req.body.latitude,
//           longitude: req.body.longitude,
//           address: req.body.address,
//           state: req.body.state,
//           country: req.body.country,
//           postalCode: req.body.postalCode,
//       });

//       await newRoomForm.save();
//       res.status(201).json(newRoomForm);
//     });
//   });

//   } catch (err){
//     next(err);
//   }
// }




// async function createRoomForm(req, res, next) {
//   console.log('hello')
//   console.log(req.body)
//   // try {
//   //   upload(req, res, async function(err) {
//   //     if (err) {
//   //       return res.status(400).json({ message: err.message });    
//   //     }

//   //     const url = req.protocol + "://" + req.get("host");
//   //     const images = req.files ? req.files.map((file) => url + "/" + file.path) : [];

//   //     const newRoomForm = new roomForm({
//   //       images: images,
//   //       city: req.body.city,
//   //       street: req.body.street,
//   //       price: req.body.price,
//   //       contact: req.body.contact,
//   //       priceType: req.body.priceType,
//   //       roomDescription: req.body.roomDescription,
//   //       parkingType: req.body.parkingType,
//   //       roomQuantity: req.body.roomQuantity,
//   //       location: {
//   //         latitude: req.body.latitude,
//   //         longitude: req.body.longitude,
//   //         address: req.body.address,
//   //         city: req.body.city,
//   //         state: req.body.state,
//   //         country: req.body.country,
//   //         postalCode: req.body.postalCode
//   //       }
//   //     });

//   //     await newRoomForm.save();
//   //     res.status(201).json(newRoomForm);
//   //   });
//   // } catch (err) {
//   //   next(err);
//   // }
// }





// get all roomform
async function getAllRoomForms(req, res, next){
  try{
    const roomForms = await roomForm.find();
    res.status(200).json(roomForms)
  } catch (err) {
    next(err);
  }
}






// // Get all rooms
// exports.getRooms = async (req, res) => {
//     try {
//       // Find all rooms in the database
//       const rooms = await RoomImage.find();
  
//       // Return a success response
//       res.status(200).send({
//         success: true,
//         data: rooms
//       });
//     } catch (error) {
//       // Return an error response
//       res.status(500).send({
//         success: false,
//         message: error.message
//       });
//     }
//   };

//get a single roomForm by Id 
async function getRoomFormById(req,res,next) {
  try {
    const roomForms = await roomForm.findById(req.params.id);
      if (!roomForms){
        return res.status(404).json({message: 'RoomForm not found'});
        
      }
      res.status(200).json(roomForms);
    } catch (err) {
      // next (err);
        // Return an error response
        res.status(500).send({
          success: false,
          message: err.message
        });

    }
  }




  // Get a single room by ID
// exports.getRoom = async (req, res) => {
//     try {
//       // Find the room with the given ID in the database
//       const room = await RoomImage.findById(req.params.id);
  
//       // Return a success response
//       res.status(200).send({
//         success: true,
//         data: room
//       });
//     } catch (error) {
//       // Return an error response
//       res.status(500).send({
//         success: false,
//         message: error.message
//       });
//     }
//   };


//Update a Roommform by Id 
async function updateRoomFormById(req, res, next) {
  try {
    const roomForms = await roomForm.findByIdAndUpdate(req.params.id, req.body,{
      new: true,
      runValidators: true,
    });
    if (!roomForms) {
      return res.status(404).json({message: "room not found"});
    }   
    res.status(200).json(roomForms);
    
  } catch (err) {
    next(err);
  }

}




//   // Update a room
// exports.updateRoom = async (req, res) => {
//     try {
//       // Find the room with the given ID in the database
//       const room = await RoomImage.findById(req.params.id);
  
//       // Update the room with the new data
//       room.images = req.body.images;
  
//       // Save the updated room to the database
//       await room.save();
  
//       // Return a success response
//       res.status(200).send({
//         success: true,
//         message: "Room updated successfully"
//       });
//     } catch (error) {
//       // Return an error response
//       res.status(500).send({
//         success: false,
//         message: error.message
//       });
//     }
//   }


//   // Delete a room
// exports.deleteRoom = async (req, res) => {
//     try {
//       // Find the room with the given ID in the database
//       const room = await Room.findById(req.params.id);
  
//       // Delete the room from the database
//       await room.remove();
  
//       // Return a success response
//       res.status(200).send({
//         success: true,
//         message: "Room deleted successfully"
//       });
//     } catch (error) {
//       // Return an error response
//       res.status(500).send({
//         success: false,
//         message: error.message
//         });
//     }
// };
  
//delete room by Id 
async function deleteRoomFormById(req, res, next) {
  try {
    const roomForms = await roomForm.findByIdAndDelete(req.params.id);
    if(!roomForms) {
      return res.status(404).json({ message: "room not found"});
    }
    res.status(200).json({message: "Room deletd successfully"});

  } catch (err) {
    next(err);
  }
}
module.exports = {
  createRoomForm,
  getAllRoomForms,
  getRoomFormById,
  updateRoomFormById,
  deleteRoomFormById
};


// exports.create = (req,res, next) => {
//   upload(req,res,function (err) {
//     if(err) {
//       next(err);
//     } else {
//       const url = req.protocol + ".//" + req.get("host");
//       const path = req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";
      
//       var model = {
//         roomForm: req.body.Room
        
        
//       }
//     }
//   })
// }



