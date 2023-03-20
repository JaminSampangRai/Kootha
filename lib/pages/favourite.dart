import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kotha_new/pages/viewRoomdetails.dart';

// import 'searchroom.dart';
// import 'viewRoomdetails.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  bool isRoomsSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite"),
          backgroundColor: const Color(0xff1d3b58),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: RoomsPage(),
            ),
          ],
        )

        // Column(children: [
        //   Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: Container(
        //       height: 90,
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //           color: const Color(0xff1d3b58),
        //           borderRadius: BorderRadius.circular(20)),
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               isRoomsSelected ? 'Rooms' : 'Roommates',
        //               style: const TextStyle(
        //                   fontSize: 20.0,
        //                   fontWeight: FontWeight.bold,
        //                   color: Color.fromARGB(255, 255, 255, 255)),
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   isRoomsSelected = !isRoomsSelected;
        //                 });
        //               },
        //               child: Container(
        //                 height: 40.0,
        //                 width: 40.0,
        //                 decoration: const BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(20.0),
        //                   ),
        //                 ),
        //                 child: Icon(
        //                   isRoomsSelected
        //                       ? Icons.keyboard_arrow_left
        //                       : Icons.keyboard_arrow_right,
        //                   color: const Color(0xff1d3b58),
        //                   size: 20.0,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   Expanded(
        //     child: Container(
        //       child: isRoomsSelected ? RoomsPage() : const RoommatesPage(),
        //     ),
        //   ),
        // ]),
        );
  }
}

class RoomsPage extends StatefulWidget {
  RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    getMyFavourites();
  }

  getMyFavourites() async {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
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
                        child: PageView.builder(
                          onPageChanged: (index) {
                            _currentPage = index;
                          },
                          // itemCount: widget.imageUrls.length,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            //container for images
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                image: DecorationImage(
                                  image:
                                      // NetworkImage(widget.imageUrls[index]),
                                      NetworkImage(
                                          "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      //for the swiping dots

                      //for the rating star
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 16.0,
                          ),
                          //put the location and price  container for negotiable
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Dharan",
                                    style: TextStyle(
                                        color: Color(0xff1d3b58),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Street Line",
                                    style: TextStyle(
                                        color: Color(0xff1d3b58),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              //
                              Column(
                                children: const [
                                  Text(
                                    "Price: Rs2000",
                                    style: TextStyle(
                                        color: Color(0xff1d3b58),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Negotiable",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Amenities",
                                style: TextStyle(
                                    // ignore: use_full_hex_values_for_flutter_colors
                                    color: Color(0xffffffff1d3b58),
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
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: const [
                                                  Icon(
                                                    Icons.water_drop_rounded,
                                                    color:
                                                        // ignore: use_full_hex_values_for_flutter_colors
                                                        Color(0xfff1d3b58),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text("Water"),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: const [
                                                  Icon(
                                                    Icons.wifi,
                                                    color:
                                                        // ignore: use_full_hex_values_for_flutter_colors
                                                        Color(0xfff1d3b58),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text("wifi"),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: const [
                                                  Icon(Icons.local_parking,
                                                      color: Color(
                                                          // ignore: use_full_hex_values_for_flutter_colors
                                                          0xfff1d3b58)),
                                                  SizedBox(height: 5),
                                                  Text("park"),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: const [
                                                  Icon(
                                                    Icons.kitchen,
                                                    color:
                                                        // ignore: use_full_hex_values_for_flutter_colors
                                                        Color(0xfff1d3b58),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text("Kitchen"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          //color
                                          const Text(
                                            "Booked",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    elevation: 2,
                                    backgroundColor: const Color(0xff1d3b58)),
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
                                    backgroundColor: const Color(0xff1d3b58)),
                                child: const Text(
                                  "Veiw Map",
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
                                    backgroundColor: const Color(0xff1d3b58)),
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
        });
  }
}
