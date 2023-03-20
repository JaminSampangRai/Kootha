const {
    addMessage,
    getMessages,
    createConversation,
    getConversation,
    getReceiver,
} = require("../controller/chat/chat");
const { isAuthenticated } = require("../services/checkUser");
const router = require("express").Router();

router.post("/addmsg/:id", addMessage);
router.get("getmsg/:id", getMessages);

router.post("/create-conversation/:id", isAuthenticated, createConversation);
router.get("/get-conversation/:id", isAuthenticated, getConversation);


router.get("/get-receiver", isAuthenticated, getReceiver);
module.exports = router;
