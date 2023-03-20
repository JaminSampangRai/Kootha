// ignore: file_names

import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kotha_new/api.dart';
import 'package:kotha_new/pages/homes.dart';

import 'package:image_picker/image_picker.dart';
import 'package:kotha_new/model/room_model.dart';
import 'package:kotha_new/pages/current_location.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../Repository/postRoom_repo.dart';

// import 'package:kotha_new/pages/formPost.dart';

class EditRoom extends StatefulWidget {
  final RoomModel roomData;
  const EditRoom({
    Key? key,
    required this.roomData,
  }) : super(key: key);

  @override
  State<EditRoom> createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
  final MapController _mapController = MapController();
  late final RoomModel? model;
  late final Function? onDelete;
  bool isAdding = false;
  bool isLoading = true;
  List<RoomModel> myRooms = [];
  var latlng = {"lat": 0.0, "lng": 0.0};
  String dropdownValue = 'Select Water Facility';
  var items = [
    'Select Water Facility',
    "once a day",
    "twice a day",
    "everytime"
  ];
  String dropdownValues = 'Select Parking Facility';
  var itemss = [
    'Select Parking Facility',
    '2 wheelers',
    '4 wheelers',
    'both',
  ];
  String dropdownValuess = 'Select Room Quantity';
  var itemsss = [
    'Select Room Quantity',
    'one',
    'two',
  ];

  final List<dynamic> _images = [];
  List<dynamic> currentImages = [];

  dynamic _groupValue;
  // bool _isChecked = false;

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _selectImage(File image) {
    setState(() {
      _images.add(image);
    });
  }

  var colors = (0xff1d3b58);

  final _formKey = GlobalKey<FormState>();

  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController roomSizeController = TextEditingController();
  TextEditingController roomDescriptionController = TextEditingController();

  bool iswifi = false;
  bool isWater = false;
  bool isPark = false;
  bool isKitchen = false;
  bool isBed = false;

  final Postrepository _repository = Postrepository();

  @override
  void initState() {
    super.initState();
    var data = widget.roomData;
    setState(() {
      currentImages = data.images;
      cityController.text = data.address;
      streetController.text = data.street;
      priceController.text = data.price.toString();
      contactController.text = data.contact;
      roomDescriptionController.text = data.roomDescription;
      roomSizeController.text = data.roomSize.toString();
      dropdownValuess = data.roomQuantity;
      dropdownValue = data.waterFacilities!;
      dropdownValues = data.parkingType;
      _groupValue = data.priceType;
      iswifi = data.wifi;
      isWater = data.water;
      isPark = data.park;
      isKitchen = data.kitchen;
      isBed = data.bed;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1d3b58),
        title: const Text(
          "Edit Room",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Current Images',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 300,
              child: CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: currentImages.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(imgUrl + i['filename']))),
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ..._images.asMap().entries.map((entry) => Container(
                            height: 200,
                            color: Colors.red,
                            margin: const EdgeInsets.only(
                                top: 10, right: 5, left: 5),
                            child: Stack(
                              children: [
                                Image.file(entry.value),
                                Positioned(
                                  top: 5.0,
                                  right: 5.0,
                                  child: IconButton(
                                    icon: const Icon(Icons.remove_circle),
                                    onPressed: () => _removeImage(entry.key),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                if (_images.length < 5)
                  TextButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Image'),
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      var image = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (image != null) {
                        _selectImage(File(image.path));
                      }
                    },
                  ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextFormField(
                        controller: cityController,
                        cursorColor: const Color(0xff1d3b58),
                        style: const TextStyle(
                          color: Color(0xff1d3b58),
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: const BorderSide(
                                color: Color(0xff1d3b58),
                                width: 3.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            labelText: 'City',
                            labelStyle:
                                const TextStyle(color: Color(0xff1d3b58)),
                            hintText: 'Dharan'),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextFormField(
                          cursorColor: const Color(0xff1d3b58),
                          controller: streetController,
                          style: const TextStyle(color: Color(0xff1d3b58)),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff1d3b58),
                                    width: 3.0,
                                    style: BorderStyle.solid),
                              ),
                              labelText: 'Street',
                              labelStyle:
                                  const TextStyle(color: Color(0xff1d3b58)),
                              hintText: 'Marga')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextFormField(
                        controller: priceController,
                        cursorColor: const Color(0xff1d3b58),
                        style: const TextStyle(
                          color: Color(0xff1d3b58),
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: const BorderSide(
                                color: Color(0xff1d3b58),
                                width: 3.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            labelText: 'Price Of Room',
                            labelStyle:
                                const TextStyle(color: Color(0xff1d3b58)),
                            hintText: '/month'),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextFormField(
                          controller: roomSizeController,
                          cursorColor: const Color(0xff1d3b58),
                          style: const TextStyle(color: Color(0xff1d3b58)),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff1d3b58),
                                    width: 3.0,
                                    style: BorderStyle.solid),
                              ),
                              labelText: 'Room SIze',
                              labelStyle:
                                  const TextStyle(color: Color(0xff1d3b58)),
                              hintText: '200sq ft')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Price",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(
                      value: "Fix",
                      groupValue: _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value;
                        });
                      },
                    ),
                    const Text("Fixed"),
                    Radio(
                      value: "Negotiable",
                      groupValue: _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value;
                        });
                      },
                    ),
                    const Text("Negotiable"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 340,
                  child: TextFormField(
                      controller: contactController,
                      cursorColor: const Color(0xff1d3b58),
                      style: const TextStyle(color: Color(0xff1d3b58)),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: const BorderSide(
                                color: Color(0xff1d3b58),
                                width: 3.0,
                                style: BorderStyle.solid),
                          ),
                          labelText: 'Contact No',
                          labelStyle: const TextStyle(color: Color(0xff1d3b58)),
                          hintText: '200sq ft')),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 340,
                  height: 150,
                  child: TextFormField(
                    controller: roomDescriptionController,
                    cursorColor: const Color(0xff1d3b58),
                    style: const TextStyle(color: Color(0xff1d3b58)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                            color: Color(0xff1d3b58),
                            width: 3.0,
                            style: BorderStyle.solid),
                      ),
                      labelText: 'Room Description',
                      labelStyle: const TextStyle(color: Color(0xff1d3b58)),
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    // expands: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: const [
                      Text(
                        "Animities",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50),
                    const Icon(Icons.wifi, color: Color(0xff1d3b58)),
                    const SizedBox(
                      width: 30,
                    ),
                    Checkbox(
                      value: iswifi,
                      checkColor: const Color(0xff1d3b58),
                      onChanged: (isCHecked) {
                        iswifi = isCHecked!;
                        setState(() {});
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey.withOpacity(.80);
                        }
                        return Colors.grey;
                      }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50),
                    const Icon(Icons.water_drop, color: Color(0xff1d3b58)),
                    const SizedBox(
                      width: 30,
                    ),
                    Checkbox(
                      value: isWater,
                      checkColor: const Color(0xff1d3b58),
                      onChanged: (isChecked) {
                        isWater = isChecked!;
                        setState(() {});
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey.withOpacity(.80);
                        }
                        return Colors.grey;
                      }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50),
                    const Icon(Icons.local_parking, color: Color(0xff1d3b58)),
                    const SizedBox(
                      width: 30,
                    ),
                    Checkbox(
                      value: isPark,
                      checkColor: const Color(0xff1d3b58),
                      onChanged: (isChecked) {
                        isPark = isChecked!;
                        setState(() {});
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey.withOpacity(.80);
                        }
                        return Colors.grey;
                      }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50),
                    const Icon(Icons.kitchen, color: Color(0xff1d3b58)),
                    const SizedBox(
                      width: 30,
                    ),
                    Checkbox(
                      value: isKitchen,
                      checkColor: const Color(0xff1d3b58),
                      onChanged: (isChecked) {
                        isKitchen = isChecked!;
                        setState(() {});
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey.withOpacity(.80);
                        }
                        return Colors.grey;
                      }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 50),
                    const Icon(Icons.bed, color: Color(0xff1d3b58)),
                    const SizedBox(
                      width: 30,
                    ),
                    Checkbox(
                      value: isBed,
                      checkColor: const Color(0xff1d3b58),
                      onChanged: (isChecked) {
                        isBed = isChecked!;
                        setState(() {});
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey.withOpacity(.80);
                        }
                        return Colors.grey;
                      }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Water Facilities",
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton(
                        elevation: 9,
                        value: dropdownValue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Parking Facility",
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton(
                      elevation: 9,
                      value: dropdownValues,
                      items: itemss.map((String itemss) {
                        return DropdownMenuItem(
                          value: itemss,
                          child: Text(itemss),
                        );
                      }).toList(),
                      onChanged: (String? newValues) {
                        setState(() {
                          dropdownValues = newValues!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Room Quantity",
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton(
                      elevation: 9,
                      // iconEnabledColor: Colors.red,
                      value: dropdownValuess,
                      items: itemsss.map((String itemsss) {
                        return DropdownMenuItem(
                          value: itemsss,
                          child: Text(itemsss),
                        );
                      }).toList(),
                      onChanged: (String? newValuess) {
                        setState(() {
                          dropdownValuess = newValuess!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: const [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff1d3b58),
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 350,
                  width: 350,
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: latlng['lat'] == 0.0
                          ? latLng.LatLng(widget.roomData.latitude,
                              widget.roomData.longitude)
                          : latLng.LatLng(latlng['lat']!, latlng['lng']!),
                      zoom: 9.2,
                      onTap: (tapPosition, point) => {
                        setState(() {
                          latlng = {
                            "lat": point.latitude,
                            "lng": point.longitude
                          };
                          _mapController.move(
                            latLng.LatLng(point.latitude, point.longitude),
                            2.0, // Zoom level
                          );
                        }),
                      },
                    ),
                    nonRotatedChildren: [
                      AttributionWidget.defaultWidget(
                        source: '',
                        onSourceTapped: null,
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: latLng.LatLng(widget.roomData.latitude,
                                widget.roomData.longitude),
                            builder: (ctx) => const SizedBox(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                //google map here
                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextButton(
                    onPressed: () async {
                      setState(() {
                        isAdding = true;
                      });
                      var roomData = {
                        'price': priceController.value.text,
                        'contact': contactController.value.text,
                        'priceType': _groupValue,
                        'roomDescription': roomDescriptionController.value.text,
                        'street': streetController.value.text,
                        'parkingType': dropdownValues,
                        'roomQuantity': dropdownValuess,
                        'waterFacilities': dropdownValue,
                        "bed": isBed,
                        "roomSize": roomSizeController.value.text,
                        // latitude,
                        // longitude,
                        'address': cityController.value.text,
                        'wifi': iswifi,
                        'water': isWater,
                        'park': isPark,
                        'kitchen': isKitchen,
                      };

                      var response = await _repository.updateRoom(
                          roomData,
                          _images.isEmpty ? currentImages : _images,
                          widget.roomData.id);
                      if (response == true) {
                        setState(() {
                          isAdding = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Room updated successfully'),
                          backgroundColor: Colors.green[400],
                        ));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Homes()));
                      } else {
                        setState(() {
                          isAdding = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Something went wrong'),
                          backgroundColor: Colors.red[400],
                        ));
                      }
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        elevation: 2,
                        backgroundColor: const Color(0xff1d3b58)),
                    child: Text(
                      isAdding == true ? 'Updating...' : "Update",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
