import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kotha_new/api.dart';
import 'package:kotha_new/apiService.dart';
import 'package:kotha_new/config.dart';

import 'package:kotha_new/model/newroommodel.dart';
import 'package:kotha_new/model/room_model.dart';
import 'package:kotha_new/pages/login.dart';
import 'package:kotha_new/pages/proflie.dart';

import 'package:kotha_new/pages/viewRoomdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Repository/auth_repo.dart';

class RoomCard extends StatefulWidget {
  // const RoomCard({super.key});
  // final List<RoomModel> room = [];
  RoomCard({Key? key, this.model, this.onDelete}) : super(key: key);
  RoomModel? model;

  final Function? onDelete;

  @override
  // ignore: library_private_types_in_public_api
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  final AuthRepository _repository = AuthRepository();
  List<RoomModel> rooms = [];

  //here init state
  bool isOpeningProfile = false;
  bool isLoading = true;
  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    if (_isFavorited) {
      //add the card to favourites
    } else {
      //remove the card

    }
  }

  int _currentPage = 0;
  // ignore: unused_field
  int _selectedIndex = 0;
  final _searchController = TextEditingController();
  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _searchFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    _getAllRooms();
  }

  _getAllRooms() async {
    // try{
    var result = await _repository.getAllrooms();
    if (result != false) {
      setState(() {
        for (var result in result) {
          rooms.add(RoomModel.fromJson(result));
        }
        isLoading = false;
      });
    }
    //   }catch(e){
    // print(e);
    //   }
  }

  List<RoomModel> rooms1 = List<RoomModel>.empty(growable: true);

  int roomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],

      //appbar starts
      appBar: AppBar(
        backgroundColor: const Color(0xff1d3b58),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  hintText: 'Search For Location',
                  border: InputBorder.none,
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  isOpeningProfile = true;
                });
                final SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                var token = _prefs.getString('token');
                if (token != null) {
                  setState(() {
                    isOpeningProfile = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (const ProfilePage())));
                } else {
                  setState(() {
                    isOpeningProfile = false;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (const Login())));
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: isOpeningProfile == true
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.person_outline_rounded),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),

      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : rooms.isEmpty
              ? const Center(
                  child: Text('No any rooms to show'),
                )
              : Stack(children: [
                  ListView.builder(
                      itemCount: rooms.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                        height: 250.0,
                                        child: CarouselSlider(
                                          options:
                                              CarouselOptions(height: 400.0),
                                          items: rooms[index].images.map((i) {
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
                                    //for the swiping dots

                                    //for the rating star
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            const RatingStars(
                                              starCount: 5,
                                              starSize: 20,
                                              starSpacing: 2,
                                              starOffColor: Color.fromARGB(
                                                  255, 167, 166, 166),
                                            ),
                                            IconButton(
                                              onPressed: _toggleFavorite,
                                              icon: _isFavorited
                                                  ? const Icon(Icons.favorite,
                                                      color: Colors.red)
                                                  : const Icon(
                                                      Icons.favorite_border),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        //put the location and price  container for negotiable
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  //  "Dharan",
                                                  rooms[index].address,

                                                  style: const TextStyle(
                                                      color: Color(0xff1d3b58),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  // "Street Line",

                                                  rooms[index].street,
                                                  style: const TextStyle(
                                                      color: Color(0xff1d3b58),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            //
                                            Column(
                                              children: [
                                                Text(
                                                  'Rs.${rooms[index].price.toString()}',
                                                  style: const TextStyle(
                                                      color: Color(0xff1d3b58),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(rooms[index].priceType,
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.deepOrange,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Amenities",
                                              style: TextStyle(
                                                  color: Color(0xff1d3b58),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      // on press action
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            if (rooms[index]
                                                                    .water ==
                                                                true)
                                                              Column(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .water_drop_rounded,
                                                                    color: Color(
                                                                        0xff1d3b58),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Text("Water"),
                                                                ],
                                                              ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            if (rooms[index]
                                                                    .wifi ==
                                                                true)
                                                              Column(
                                                                children: const [
                                                                  Icon(
                                                                    Icons.wifi,
                                                                    color: Color(
                                                                        0xff1d3b58),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Text("wifi"),
                                                                ],
                                                              ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            if (rooms[index]
                                                                    .park ==
                                                                true)
                                                              Column(
                                                                children: const [
                                                                  Icon(
                                                                      Icons
                                                                          .local_parking,
                                                                      color: Color(
                                                                          0xff1d3b58)),
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Text("park"),
                                                                ],
                                                              ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            if (rooms[index]
                                                                    .kitchen ==
                                                                true)
                                                              Column(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .kitchen,
                                                                    color: Color(
                                                                        0xff1d3b58),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Text(
                                                                      "Kitchen"),
                                                                ],
                                                              ),
                                                          ],
                                                        ),
                                                        //color
                                                        rooms[index].isBooked ==
                                                                true
                                                            ? const Text(
                                                                "Booked",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            : const Text(
                                                                "Available",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        //buttons
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  elevation: 2,
                                                  backgroundColor:
                                                      const Color(0xff1d3b58)),
                                              child: const Text(
                                                "Rent Now",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  elevation: 2,
                                                  backgroundColor:
                                                      const Color(0xff1d3b58)),
                                              child: const Text(
                                                "View Map",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            (const Viewroomdetail())));
                                              },
                                              style: TextButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  elevation: 2,
                                                  backgroundColor:
                                                      const Color(0xff1d3b58)),
                                              child: const Text(
                                                "Veiw details",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  DraggableFab(
                    child: FloatingActionButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                return SortByUI(
                                    onSortOptionChanged: (sortOption) {
                                  setState(() {
                                    //update state with selected sort option
                                  });
                                  Navigator.of(context).pop();
                                });
                              });
                            });
                      },
                      tooltip: 'sort rounded',
                      child: const Icon(
                        Icons.sort_rounded,
                      ),
                    ),
                  ),
                ]),
    );
  }
}

class SortByUI extends StatefulWidget {
  final Function(String) onSortOptionChanged;

  const SortByUI({Key? key, required this.onSortOptionChanged})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SortByUIState createState() => _SortByUIState();
}

class _SortByUIState extends State<SortByUI> {
  String _selectedSortOption = 'Newest Rent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          // border: Border(
          //   top: BorderSide(color: Colors.grey, width: 2),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,

                children: const [
                  Text(
                    'Sort by:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SortOptionRadioButton(
                    sortOption: 'Newest Rent',
                    selectedSortOption: _selectedSortOption,
                    onOptionChanged: (value) {
                      setState(() {
                        _selectedSortOption = value;
                        widget.onSortOptionChanged(value);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SortOptionRadioButton(
                    sortOption: 'Lowest Rent',
                    selectedSortOption: _selectedSortOption,
                    onOptionChanged: (value) {
                      setState(() {
                        _selectedSortOption = value;
                        widget.onSortOptionChanged(value);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SortOptionRadioButton(
                    sortOption: 'Highest Rent',
                    selectedSortOption: _selectedSortOption,
                    onOptionChanged: (value) {
                      setState(() {
                        _selectedSortOption = value;
                        widget.onSortOptionChanged(value);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SortOptionRadioButton extends StatelessWidget {
  final String sortOption;
  final String selectedSortOption;
  final Function(String) onOptionChanged;

  const SortOptionRadioButton({
    Key? key,
    required this.sortOption,
    required this.selectedSortOption,
    required this.onOptionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sortOption,
          style: TextStyle(
            fontSize: 14,
            color: sortOption == selectedSortOption
                ? Colors.black
                : Colors.grey[400],
          ),
        ),
        Radio(
          value: sortOption,
          groupValue: selectedSortOption,
          onChanged: (value) => onOptionChanged(value!),
        ),
      ],
    );
  }
}

class Botnav extends StatefulWidget {
  const Botnav({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BotnavState createState() => _BotnavState();
}

class _BotnavState extends State<Botnav> with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.forward(from: 0.0);
    // You can add your navigation code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.post_add_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => _onItemTapped(2),
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_home,
                  progress: _controller,
                ),
                onPressed: () => _onItemTapped(0),
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              IconButton(
                icon: const Icon(Icons.chat_rounded),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (const ProfilePage())));
                },
                // color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadRoom() {
    return FutureBuilder(
      future: APIService.getRooms(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<RoomModel>?> model,
      ) {
        if (model.hasData) {
          return ListView.builder(
              itemCount: model.data!.length,
              itemBuilder: (context, index) {
                return RoomCard(
                  model: model.data![index],
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
