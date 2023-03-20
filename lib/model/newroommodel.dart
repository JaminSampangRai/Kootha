// class RentalRoom {
//   List<String>? images;
//   String? city;
//   int? price;
//   String? street;
//   String? priceType;
//   bool? water;
//   bool? wifi;
//   bool? parking;
//   bool? kitchen;
//   bool? electricity;
//   String? contact;
//   String? roomDescription;
//   String? parkingType;
//   String? roomQuantity;
//   int? age;
//   String? gender;
//   int? budget;
//   String? profession;
//   String? userDescription;
//   String? profilepic;
//   String? id;

//   RentalRoom({
//     this.images,
//     this.city,
//     this.price,
//     this.street,
//     this.priceType,
//     this.water,
//     this.wifi,
//     this.parking,
//     this.kitchen,
//     this.electricity,
//     this.contact,
//     this.roomDescription,
//     this.parkingType,
//     this.roomQuantity,
//     this.age,
//     this.gender,
//     this.budget,
//     this.profession,
//     this.userDescription,
//     this.profilepic,
//     this.id, required String roomQunatity,
//   });

//   RentalRoom.fromJson(Map<String, dynamic> json) {
//     images = json['images'].cast<String>();
//     city = json['city'];
//     price = json['price'];
//     street = json['street'];
//     priceType = json['priceType'];
//     water = json['water'];
//     wifi = json['wifi'];
//     parking = json['parking'];
//     kitchen = json['kitchen'];
//     electricity = json['electricity'];
//     contact = json['contact'];
//     roomDescription = json['roomDescription'];
//     parkingType = json['parkingType'];
//     roomQuantity = json['roomQuantity'];
//     age = json['age'];
//     gender = json['gender'];
//     budget = json['budget'];
//     profession = json['profession'];
//     userDescription = json['userDescription'];
//     profilepic = json['profilepic'];
//     id = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};

//     _data['images'] = images;
//     _data['city'] = city;
//     _data['price'] = price;
//     _data['street'] = street;
//     _data['priceType'] = priceType;
//     _data['water'] = water;
//     _data['wifi'] = wifi;
//     _data['parking'] = parking;
//     _data['kitchen'] = kitchen;
//     _data['electricity'] = electricity;
//     _data['contact'] = contact;
//     _data['roomDescription'] = roomDescription;
//     _data['parkingType'] = parkingType;
//     _data['roomQuantity'] = roomQuantity;
//     _data['age'] = age;
//     _data['gender'] = gender;
//     _data['budget'] = budget;
//     _data['profession'] = profession;
//     _data['userDescription'] = userDescription;
//     _data['profilepic'] = profilepic;
//     _data['_id'] = id;
//     return _data;
//   }

//   // factory RentalRoom.fromJson(Map<String, dynamic> json) {
//   //   return RentalRoom(
//   //     images: List<String>.from(json['images']),
//   //     city: json['city'],
//   //     price: json['price'],
//   //     street: json['street'],
//   //     priceType: json['priceType'],
//   //     water: json['water'],
//   //     wifi: json['wifi'],
//   //     parking: json['parking'],
//   //     kitchen: json['kitchen'],
//   //     electricity: json['electricity'],
//   //     contact: json['contact'],
//   //     roomDescription: json['roomDescription'],
//   //     parkingType: json['parkingType'],
//   //     roomQuantity: json['roomQuantity'],
//   //     age: json['age'],
//   //     gender: json['gender'],
//   //     budget: json['budget'],
//   //     profession: json['profession'],
//   //     userDescription: json['userDescription'],
//   //     profilepic: json['profilepic'],
//   //     id: json['_id'],

//   //   );
//   // }

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'images': images,
//   //     'city': city,
//   //     'price': price,
//   //     'street': street,
//   //     'priceType': priceType,
//   //     'water': water,
//   //     'wifi': wifi,
//   //     'parking': parking,
//   //     'kitchen': kitchen,
//   //     'electricity': electricity,
//   //     'contact': contact,
//   //     'roomDescription': roomDescription,
//   //     'parkingType': parkingType,
//   //     'roomQuantity': roomQuantity,
//   //     'age': age,
//   //     'gender': gender,
//   //     'budget': budget,
//   //     'profession': profession,
//   //     'userDescription': userDescription,
//   //     'profilepic': profilepic,
//   //     '_id': id,

//   //   };
//   // }
// }
