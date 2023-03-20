const multer = require('multer');
const path = require('path');




const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  },
});
const imageFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb("Please upload only images.", false);
  }
};

const uploads = multer({ storage, imageFilter });
module.exports = uploads;

// module.exports = uploadMiddleware;

//set up storage engine
// const storage = multer.diskStorage({
//     destination: function(req, file, cb) {
//         cb(null,"./uploads");
        
//     },
//     filename: function (req, file, cb) {
//         const ext = path.extname(file.originalname);
//         cb(null,file.fieldname + "-"+ Date.now() + ext);
//     }
// });


// // //Initialize upload object
// // const upload = multer({
// //     storage: storage,
// //     limits: {
// //         fileSize: 5000000
// //     },
// //     fileFilter: function(req, file,cb) {
// //         if(!file.originalname.match(/\.(jpg|jpeg|png)$/)){
// //             return cb(new Error("Only images files are allowed"),false);
// //         }
// //         cb(null,true);
// //     }
// // }).array("images",5);
// // module.exports = upload;

// const upload = multer({
//     storage: storage,
//     limits: {
//       fileSize: 5000000
//     },
//     fileFilter: function(req, file, cb) {
//       if (!file.originalname.match(/\.(jpg|jpeg|png)$/)) {
//         return cb(new Error("Only images files are allowed"), false);
//       }
//       cb(null, true);
//     }
//   }).array("images", 5);
  
//   // Update the upload middleware to add the filenames array to the req object
//   const uploadMiddleware = (req, res, next) => {
//     upload(req, res, function(err) {
//       if (err) {
//         return res.status(400).json({ message: err.message });
//       }
//       // Add the filenames array to the req object
//       req.filenames = req.files.map((file) => file.filename);
//       next();
//     });
//   };

  





