const multer = require('multer');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "upload/");
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

const upload = multer({ storage, imageFilter });
module.exports = upload;







// const multer = require('multer');


// const storage = multer.diskStorage({
//   destination: (req, file, cb) => {
//     cb(null, './uploads');
//   },
//   filename: (req, file, cb) => {
//     cb(null, `${Date.now()}-${file.originalname}`);
//   },
// });

// const fileFilter = (req, file, cb) => {
//   // Only accept image files with a .jpg, .jpeg, or .png extension
//   if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
//     cb(null, true);
//   } else {
//     cb(new Error('Invalid file type. Only JPG, JPEG, and PNG image files are allowed.'), false);
//   }
// };

// const upload = multer({
//   storage: storage,
//   limits: {
//     fileSize: 1024 * 1024 * 10, // 5 MB
//   },
//   fileFilter: fileFilter,
// });

// const uploadImages = (req, res, next) => {
//   upload.array('images', 5)(req, res, (err) => {
//     if (err) {
//       return res.status(400).json({ error: err.message });
//     }
//     next();
//   });
// };

// // module.exports = uploadImages;
// const uploads = multer({ upload, uploadImages });
// module.exports = uploads;





// const multer = require("multer");

// const storage = multer.diskStorage({
//   destination: (req, file, cb) => {
//     cb(null, "uploads/");
//   },
//   filename: (req, file, cb) => {
//     cb(null, file.originalname);
//   },
// });
// const imageFilter = (req, file, cb) => {
//   if (file.mimetype.startsWith("image")) {
//     cb(null, true);
//   } else {
//     cb("Please upload only images.", false);
//   }
// };

// const upload = multer({ storage, imageFilter });
// module.exports = upload;
