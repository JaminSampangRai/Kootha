
const express = require("express");
const router = express.Router();
const multer = require("multer");


const roomController = require("./../controller/newroom");
const profileUpload = require("./../middleware/profileupload");
const middlewareUpload = require("../middleware/imageupload");


// router.post("/newroom",middlewareUpload.array("images",5),profileUpload.single("profilepic"),roomController.newRoom);
router.post("/newroom",middlewareUpload.fields([{name:"images",maxCount:5},{name:"profilepic",maxCount:1}]),roomController.newRoom);


router.get("/getrooms",roomController.getAllRooms);

router.get("/oneroom/:id",roomController.getRoom);
router.put("/updateoneroom/:id",roomController.updateRoom);
router.delete("/deleteoneroom/:id",roomController.deleteRoom);

module.exports = router;




