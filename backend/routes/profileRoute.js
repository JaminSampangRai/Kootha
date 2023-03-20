const {
    updateProfile,
    getProfile,
    getAllUser,
} = require("../controller/auth/profile");
const { isAuthenticated } = require("../services/checkUser");
const { storage, multer } = require("../services/multerConfig");
const upload = multer({ storage: storage});
const router = require("express").Router();

router.route("/profile").post(isAuthenticated, upload.single("image"),updateProfile);

router.route("/profile").get(isAuthenticated, getProfile);

router.route("/alluser").get(getAllUser);

// router
//   .route("/edit-room/:id")
//   .post(isAuthenticated, upload.array("images"), editRoom);

module.exports = router;
