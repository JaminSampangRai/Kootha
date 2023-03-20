// require("dotenv").config();


// module.exports = {
//     PORT : process.env.PORT || 3000,
//     secret: "auth-secret-key",
// }


const mongoose = require("mongoose");

function mongooseConnect(url) {
    mongoose.connect(url,{
        useNewUrlParser: true,
        useUnifiedTopology: true,
    })
    .then(() => {
        console.log("mongodb is connected");
    })
    .catch((err) => {
        console.log(err);
    })
}

module.exports = mongooseConnect;