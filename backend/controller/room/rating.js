const Rating = require("../../model/ratingModel");

exports.addRating = async (req,res) => {
    const {rating, review } = req.body;

    if (!rating || !review) {
        res.status(400).json({
          status: 400,
          message: "please fill the required form",
        });
    }

    let data = {
        rating,
        review,
        roomId: req.params.id,
        userId: req.userId,
      };
      try {
        const AddRating = await Rating.create({ ...data });
        res.status(200).json({
          status: 200,
          data: AddRating,
        });
      } catch (error) {
        res.status(200).json({
          status: 200,
          message: "error occured while adding rating",
        });
    }
};


exports.getAllRating = async (req,res) => {
    console.log(req.params.id, "me");
    const allRating = await Rating.find({roomId: req.params.id }).populate(
        "userId"
    );
    if (allRating) {
        res.status(200).json({
            status: 200,
            data: allRating,
            message: "success",
        });
    } else {
        res.status(400).json({
            status: 400,
            message: "error while fetching rating",
        });
    }
};