const { 
    addRoom,
    getAllRoom,
    deleteRoom,
    editRoom,
    getUserPostRoom,
} = require("../controller/room/room");

const { isAuthenticated } = require("../services/checkUser");
const { storage, multer } = require("../services/multerConfig");

const upload = multer({ storage: storage });
const router = require("express").Router();

//add room 
router.route("/add-room").post(isAuthenticated,upload.array("images"),addRoom);
//getall
router.route("/get-all-room").get(getAllRoom);
//delete by id
router.route("/delete/:id").get(isAuthenticated, deleteRoom);
//getpostroom
router.route("/get-post-room").get(isAuthenticated, getUserPostRoom);
//edit
router.route("/edit-room/:id").post(isAuthenticated, upload.array("images"), editRoom);

module.exports = router;



// const express = require("express");
// const router = express.Router();
// const multer = require("multer");
// const upload = multer();
// const roomFormController = require("../controller/roomController");
// const validateRoomForm = require("../middleware/validationroomform");
// const middlewareUpload = require("../middleware/upload");
// const imageuploads = require("../middleware/imageupload");

// // create a new room
// router.post("/createroom",middlewareUpload.array("images",5),roomFormController.createRoomForm);


// // upload.none()

// //Get all room forms
// router.get("/getroom", roomFormController.getAllRoomForms);

// //get a single room by id 
// router.get("/room/:id",roomFormController.getRoomFormById);

// //update a room by id
// router.put("/updateroom/:id", roomFormController.updateRoomFormById);

// //delete a room by id
// router.delete("/deleteroom/:id",roomFormController.deleteRoomFormById);

// module.exports = router;

