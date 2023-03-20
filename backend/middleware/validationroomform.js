const Joi = require('joi');


function validateRoomForm(req, res, next) {
  console.log(req.body);

  const schema = Joi.object({
    images: Joi.array().items(Joi.string().required()),
    city: Joi.string().required(),
    street: Joi.string().required(),
    price: Joi.number().required(),
    contact: Joi.string().required(),
    priceType: Joi.string().valid('fix', 'negotiable').required(),
    roomDescription: Joi.string().required(),
    parkingType: Joi.string().valid('2 wheelers', '4 wheelers', 'both').required(),
    roomQuantity: Joi.number().required(),
    latitude: Joi.number().required(),
    longitude: Joi.number().required(),
    address: Joi.string().required(),
    state: Joi.string().required(),
    country: Joi.string().required(),
    postalCode: Joi.string().required()
  });

  const { error } = schema.validate(req.body);
  if (error) {
    return res.status(400).json({ message: error.details[0].message });
  }

  next();
}




// function validateRoomForm(req, res, next) {
//     const { city, street, price, contact, priceType, roomDescription, parkingType, roomQuantity, latitude, longitude, address, state, country, postalCode } = req.body;
  
//     // Check that required fields are present
//     if (!city || !street || !price || !contact || !roomDescription) {
//       return res.status(400).json({ message: 'Missing required fields' });
//     }
  
//     // Check that numeric fields are valid numbers
//     if (isNaN(price) || isNaN(roomQuantity) || isNaN(latitude) || isNaN(longitude)) {
//       return res.status(400).json({ message: 'Invalid numeric field(s)' });
//     }
  
//     // Check that priceType is either "nightly" or "weekly"
//     if (priceType !== 'fix' && priceType !== 'negotiable') {
//       return res.status(400).json({ message: 'Invalid price type' });
//     }
  
//     // Check that parkingType is either "on-street" or "garage"
//     if (parkingType !== '2 wheelers' && parkingType !== '4 wheelers' && parkingType !== 'both') {
//       return res.status(400).json({ message: 'Invalid parking type' });
//     }
  
//     // Check that all fields are strings
//     const allFields = [city, street, price.toString(), contact, priceType, roomDescription, parkingType, roomQuantity.toString(), latitude.toString(), longitude.toString(), address, state, country, postalCode];
//     if (!allFields.every((field) => typeof field === 'string')) {
//       return res.status(400).json({ message: 'Invalid field(s)' });
//     }
  
//     // If all checks pass, continue to next middleware function
//     next();
//   }

module.exports = { validateRoomForm };
  