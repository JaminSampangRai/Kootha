const express = require("express");
const app = express();
const cors = require("cors");
const path = require("path");
const config = require("./config/app.config");
const mongoose = require("mongoose");
mongoose.set("strictQuery", false);
const socket = require("socket.io");
const mongooseConnect = require("./config/app.config");

app.use(express.json());
app.use(express.urlencoded({ extended: true })); // for form data

// mongoose
//   .connect("mongodb://localhost:27017/room")
//   .then(() => console.log("MongoDB connected..."))
//   .catch((err) => console.log(err));


  const userRoute = require("./routes/userRoute");
  const roomRoute = require("./routes/roomRoutes");
  const ratingRoute = require("./routes/ratingRoute");
  const wishlistRoute = require("./routes/wishlistRoute");
  const profileRoute = require("./routes/profileRoute");
  const bookingRoute = require("./routes/BookingRoute");
  const userWishlistRoute = require("./routes/userWishlistRoute");
  const chatRoute = require("./routes/ChatRoute");



  const corsOption = {
    origin: "*",
    credentials: true,
    preflightContinue: false,
  };
  app.use(cors(corsOption));


  let uri = "mongodb://localhost:27017/Kootha";
  mongooseConnect(uri);
  


  app.use(express.static(path.join(__dirname, "uploads")));
  app.use("/api",userRoute);
  app.use("/api",roomRoute);
  app.use("/api",ratingRoute);
  app.use("/api",profileRoute);
  app.use("/api",wishlistRoute);
  app.use("/api",bookingRoute);
  app.use("/api",userWishlistRoute);
  app.use("/api",chatRoute);






  app.all("*", (req, res, next) => {
    // const err = new Error(`Cannot find path ${req.originalUrl} `);
    // err.status = "fail";
    // err.statusCode = 404;
    res.json({
      message: "errror",
    });
    //   next(new AppError(`Cannot find path ${req.originalUrl} `, 404));
  });


  const PORT = 3000;

const server = app.listen(PORT, () => {
  console.log(`serving at port ${PORT}`);
});

const io = socket(server, {
  cors: {
    origin: "http://localhost:3000",
    credentials: true,
  },
});

global.onlineUsers = new Map();
io.on("connection", (socket) => {
  global.chatSocket = socket;
  socket.on("add-user", (userId) => {
    onlineUsers.set(userId, socket.id);
  });

  socket.on("send-msg", (data) => {
    const sendUserSocket = onlineUsers.get(data.to);
    if (sendUserSocket) {
      socket.to(sendUserSocket).emit("msg-recieve", data.msg);
    }
  });
});






// //user signup login route
// const routes = require("./routes/signupRoute");
// app.use("/user", routes);

// //room form route
// const roomController = require("./routes/roomRoutes");
// app.use("/roomapi", roomController);

// // const imageupp = require("./routes/imageRoute")
// // app.use("/upload",imageupp);

// const newroomRoutes = require("./routes/newroomRoute");
// app.use("/newapiroom", newroomRoutes);

// app.use(express.static(path.join(__dirname, "upload")))

// app.listen(3001, () => {
//   console.log(`App is listening on port 3001`);
// });
