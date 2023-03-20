const Messages = require("../../model/chatModel");
const conversationModel = require("../../model/conversationModel");

const Profile = require("../../model/profileModel");

module.exports.createConversation = async (req, res) => {
  const existedConversation = await conversationModel.find({
    userOne: req.userId,
    userTwo: req.params.id,
  });

  if (existedConversation) {
    return res.json({ msg: "already" });
  }

  const createConvo = await conversationModel.create({
    userOne: req.userId,
    userTwo: req.params.id,
  });
  if (createConvo) return res.json({ msg: "conversation added successfully." });
  else return res.json({ msg: "Failed to add message to the database" });
};

module.exports.getConversation = async (req, res) => {
  const createConvo = await conversationModel
    .find({
      _id: req.params.id,
    })
    .populate({
      path: "userOne",
      populate: {
        path: "profileId",
        model: "Profile",
      },
    })
    .populate({
      path: "userTwo",
      populate: {
        path: "profileId",
        model: "Profile",
      },
    });
  if (createConvo)
    return res.json({
      msg: "conversation added successfully.",
      data: createConvo,
    });
  else return res.json({ msg: "Failed to add message to the database" });
};

module.exports.getMessages = async (req, res, next) => {
  try {
    const { from, to } = req.body;

    const messages = await Messages.find({
      conversationId: req.params.id,
    }).sort({ updatedAt: 1 });

    const projectedMessages = messages.map((msg) => {
      return {
        fromSelf: msg.sender.toString() === from,
        message: msg.message.text,
      };
    });
    res.json(projectedMessages);
  } catch (ex) {
    next(ex);
  }
};

module.exports.addMessage = async (req, res, next) => {
  try {
    const { from, to, message } = req.body;
    const id = req.params.id;
    console.log(id);
    const data = await Messages.create({
      message: { text: message },
      users: [from, to],
      sender: from,
      receiver: to,
      conversationId: id,
    });

    if (data) return res.json({ msg: "Message added successfully.", data });
    else return res.json({ msg: "Failed to add message to the database" });
  } catch (ex) {
    next(ex);
  }
};

// exports.getReceiver = async (req, res) => {
//   const userId = req.userId;
//   const receiver = await Messages.find({
//     sender: userId,
//   }).populate({
//     path: "receiver",
//     populate: {
//       path: "profileId",
//       model: "Profile",
//     },
//   });

//   res.json({ msg: "Failed to add message to the database", data: receiver });

//   console.log(receiver);
// };

exports.getReceiver = async (req, res) => {
  console.log(req.userId);
  const messages = await Messages.find({
    users: { $all: [req.userId] },
  });

  console.log(messages);
  res.json({
    status: 200,
    messages,
  });
};
