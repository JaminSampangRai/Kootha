// ignore: file_names

import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kotha_new/api.dart';
// import 'package:kotha_new/Repo/map_repo.dart';
import 'package:kotha_new/pages/Rooms/edit_room.dart';
import 'package:kotha_new/pages/homes.dart';
// import 'package:kotha_new/Repo/postRoom_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kotha_new/model/room_model.dart';
import 'package:kotha_new/pages/current_location.dart';
// import 'package:kotha_new/pages/formPost.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../Repository/map_repo.dart';
import '../../Repository/postRoom_repo.dart';

// import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
class PostRoom extends StatefulWidget {
  const PostRoom({
    Key? key,
  }) : super(key: key);

  @override
  State<PostRoom> createState() => _PostRoomState();
}

class _PostRoomState extends State<PostRoom> {
  final MapController _mapController = MapController();
  bool gettingLocation = false;
  late final RoomModel? model;
  late final Function? onDelete;
  bool isAdding = false;
  bool isLoading = true;
  bool isDeleting = false;
  List<RoomModel> myRooms = [];
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

  final List<File> _images = [];
  var latlng = {"lat": 51.509364, "lng": -0.128928};
  dynamic _groupValue;
  bool _isChecked = false;

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
    getUserAddedRooms();
  }

  getUserAddedRooms() async {
    var res = await _repository.getUserRooms();
    print(res);
    if (res != false) {
      setState(() {
        for (var result in res) {
          myRooms.add(RoomModel.fromJson(result));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1d3b58),
          title: const Text(
            "Post Room",
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Post Room',
              ),
              Tab(
                text: 'View Posted Room',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Expanded(child: ImageUploader()), yo cahi real ma ho
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._images.asMap().entries.map((entry) => Container(
                                  // width: 300,
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
                                          onPressed: () =>
                                              _removeImage(entry.key),
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
                                style:
                                    const TextStyle(color: Color(0xff1d3b58)),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xff1d3b58),
                                          width: 3.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelText: 'Street',
                                    labelStyle: const TextStyle(
                                        color: Color(0xff1d3b58)),
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
                                style:
                                    const TextStyle(color: Color(0xff1d3b58)),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xff1d3b58),
                                          width: 3.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelText: 'Room SIze',
                                    labelStyle: const TextStyle(
                                        color: Color(0xff1d3b58)),
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
                                labelStyle:
                                    const TextStyle(color: Color(0xff1d3b58)),
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
                            labelStyle:
                                const TextStyle(color: Color(0xff1d3b58)),
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
                          const Icon(Icons.water_drop,
                              color: Color(0xff1d3b58)),
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
                          const Icon(Icons.local_parking,
                              color: Color(0xff1d3b58)),
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
                              // iconDisabledColor: Colors.red,
                              elevation: 9,
                              // iconEnabledColor: Colors.red,
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
                            // iconEnabledColor: Colors.red,
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
                            // onChanged: (String newValue) {
                            //   setState(() {
                            //     dropdownValues = newValue;
                            //   });
                            // },
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
                            // onChanged: (String? newValue) {
                            //   setState(() {
                            //     dropdownValuess = newValue!;
                            //   });
                            // },
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
                            center:
                                latLng.LatLng(latlng['lat']!, latlng['lng']!),
                            zoom: 9.2,
                            onTap: (tapPosition, point) => {
                              setState(() {
                                latlng = {
                                  "lat": point.latitude,
                                  "lng": point.longitude
                                };
                                _mapController.move(
                                  latLng.LatLng(
                                      point.latitude, point.longitude),
                                  15.0, // Zoom level
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
                                  point: latLng.LatLng(
                                      latlng['lat']!, latlng['lng']!),
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

                      ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              gettingLocation = true;
                            });
                            var res = await MapRepo().determinePosition();

                            setState(() {
                              gettingLocation = false;
                              latlng = {
                                'lat': res.latitude,
                                'lng': res.longitude
                              };

                              _mapController.move(
                                latLng.LatLng(res.latitude, res.longitude),
                                15.0, // Zoom level
                              );
                            });
                          },
                          child: Text(gettingLocation == true
                              ? 'Finding you..'
                              : 'Use current location')),

                      const SizedBox(
                        height: 10,
                      ),
                      latlng == null
                          ? const Text('')
                          : Text('Your location is : $latlng '),
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
                              'roomDescription':
                                  roomDescriptionController.value.text,
                              'street': streetController.value.text,
                              'parkingType': dropdownValues,
                              'roomQuantity': dropdownValuess,
                              'waterFacilities': dropdownValue,
                              "bed": isBed,
                              "roomSize": roomSizeController.value.text,
                              "latitude": latlng['lat'],
                              "longitude": latlng['lng'],
                              'address': cityController.value.text,
                              'wifi': iswifi,
                              'water': isWater,
                              'park': isPark,
                              'kitchen': isKitchen,
                            };

                            var response = await _repository.uploadImage(
                                roomData, _images);
                            if (response == true) {
                              setState(() {
                                isAdding = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Romm added successfully'),
                                backgroundColor: Colors.green[400],
                              ));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Homes()));
                            } else {
                              setState(() {
                                isAdding = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Something went wrong'),
                                backgroundColor: Colors.red[400],
                              ));
                            }
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: const Color(0xff1d3b58)),
                          child: Text(
                            isAdding == true ? 'Adding...' : "Add Room",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: myRooms.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 250,
                                        child: CarouselSlider(
                                          options:
                                              CarouselOptions(height: 400.0),
                                          items: myRooms[index].images.map((i) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5.0),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.amber),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  imgUrl +
                                                                      i['filename']))),
                                                    ));
                                              },
                                            );
                                          }).toList(),
                                        )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => EditRoom(
                                                          roomData:
                                                              myRooms[index],
                                                        )));
                                          },
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              elevation: 2,
                                              backgroundColor:
                                                  const Color(0xff1d3b58)),
                                          child: const Text(
                                            "Edit Room",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              isDeleting = true;
                                            });
                                            var res = await Postrepository()
                                                .deleteRoom(myRooms[index].id);
                                            if (res == true) {
                                              setState(() {
                                                isDeleting = false;
                                              });
                                              getUserAddedRooms();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content: Text(
                                                          'Successfully Deleted')));

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => Homes()));
                                            } else {
                                              setState(() {
                                                isDeleting = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'Not  Deleted')));
                                            }
                                          },
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              elevation: 2,
                                              backgroundColor:
                                                  const Color(0xff1d3b58)),
                                          child: Text(
                                            isDeleting == true
                                                ? 'Delteing....'
                                                : "Delete Room",
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

