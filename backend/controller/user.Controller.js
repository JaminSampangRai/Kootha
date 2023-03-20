const bcrypt = require("bcrypt");
const { Router } = require("express");
const User = require("../model/userModel");
const express = require("express");
const router = express.Router();
const SECRET_KEY = "JAMIN";
const jwt = require("jsonwebtoken");

const signup = async (req, res) => {
  const { name, email, password } = req.body;
  try {
    const existingUser = await User.findOne({ email: email });
    if (existingUser) {
      return res
        .status(200)
        .json({ message: "user already exists", status: 409 });
    }
    const hashedPassword = await bcrypt.hash(password, 10);
    const result = await User.create({
      email: email,
      password: hashedPassword,
      name: name,
    });
    if (!result) {
      return res
        .status(200)
        .json({ message: "something went wrong", status: 400 });
    }
    const token = jwt.sign({id: result._id}, SECRET_KEY);
    // res.status(201).json({ user: result, token });
    res.status(201).json({ user: result, token, status:201
     });
  } catch (error) {
    res
      .status(500)
      .json({ message: "something went wrong", status: 500, error });
  }
};
// logins the user
const login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne({ email: email });
    if (!User)
      return res.status(404).json({ message: "user not found", status: 404 });

    const isValid = await bcrypt.compare(password, user.password);
    if (!isValid) {
      return res
        .status(401)
        .json({ message: "incorrect password", status: 401 });
    }
    // generating token
    const token = jwt.sign({ email: user.email, id: user._id }, SECRET_KEY);
    res.status(200).json({ message: "login success", token, status: 200 });
  } catch (error) {
    res
      .status(500)
      .json({ message: "something went wrong", status: 500, error });
  }
};
// logout controller
const logout = async (req, res) => {
  try {
    res.clearCookie("token");
    res.status(200).json({ message: "logout success", status: 200 });
  } catch (error) {
    res
      .status(500)
      .json({ message: "something went wrong", status: 500, error });
  }
};

module.exports = { signup, login };
