// import 'package:flutter/material.dart';
// import 'package:kotha_new/pages/proflie.dart';
// import 'package:kotha_new/pages/viewRoomdetails.dart';
// import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';

// class Searchroom extends StatefulWidget {
//   Searchroom({Key? key}) : super(key: key);

//   @override
//   State<Searchroom> createState() => _SearchroomState();
// }

// class _SearchroomState extends State<Searchroom> {
//   int _selectedIndex = 0;
//   final _searchController = TextEditingController();
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   final _searchFocus = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _searchFocus.addListener(_onFocusChange);
//   }

//   void _onFocusChange() {
//     if (!_searchFocus.hasFocus) {
//       FocusScope.of(context).requestFocus(FocusNode());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff1d3b58),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               width: 230,
//               height: 40,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: Center(
//                   child: TextField(
//                 controller: _searchController,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.search),
//                     onPressed: () {},
//                   ),
//                   hintText: 'Search For Location',
//                   border: InputBorder.none,
//                 ),
//               )),
//             ),
//             // const SizedBox(
//             //   width: 30,
//             // ),
//             GestureDetector(
//               onTap: () {
//                 // code to handle the press event
//               },
//               child: const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.person_outline_rounded),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         child: Padding(
//           padding: const EdgeInsets.all(9.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.home),
//                 onPressed: () => _onItemTapped(2),
//                 color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               IconButton(
//                 icon: Icon(Icons.favorite),
//                 onPressed: () => _onItemTapped(0),
//                 color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//               IconButton(
//                 icon: Icon(Icons.person_outline_rounded),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => (ProfilePage())));
//                 },
//                 // color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return Container(
//               height: 450,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: Carousels(),
//                   ),
//                   Container(
//                     color: Color.fromARGB(255, 219, 219, 218),
//                     height: 60,
//                     width: MediaQuery.of(context).size.width,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: const [
//                               Text(
//                                 "Dharan",
//                                 style: TextStyle(
//                                     color: Color(0xff1d3b58),
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 "Street Line",
//                                 style: TextStyle(
//                                     color: Color(0xff1d3b58),
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: const [
//                               Text(
//                                 "Price: Rs2000",
//                                 style: TextStyle(
//                                     color: Color(0xff1d3b58),
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text("Negotiable",
//                                   style: TextStyle(
//                                       color: Colors.deepOrange,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Color.fromARGB(255, 219, 219, 218),
//                     height: 100,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Amenities",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold)),
//                           SizedBox(height: 10),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: InkWell(
//                                   onTap: () {
//                                     // on press action
//                                   },
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Column(
//                                             children: [
//                                               Icon(Icons.water_drop_rounded),
//                                               SizedBox(height: 5),
//                                               Text("Water"),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Column(
//                                             children: [
//                                               Icon(Icons.wifi),
//                                               SizedBox(height: 5),
//                                               Text("wifi"),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Column(
//                                             children: [
//                                               Icon(Icons.local_parking),
//                                               SizedBox(height: 5),
//                                               Text("park"),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Column(
//                                             children: [
//                                               Icon(Icons.kitchen),
//                                               SizedBox(height: 5),
//                                               Text("Kitchen"),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       //color
//                                       Text(
//                                         "Booked",
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             color: Colors.orange,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 60,
//                     color: Color.fromARGB(255, 219, 219, 218),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               elevation: 2,
//                               backgroundColor: const Color(0xff1d3b58)),
//                           child: const Text(
//                             "Rent Now",
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => (Viewroomdetail())));
//                           },
//                           style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               elevation: 2,
//                               backgroundColor: const Color(0xff1d3b58)),
//                           child: const Text(
//                             "Veiw details",
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               elevation: 2,
//                               backgroundColor: const Color(0xff1d3b58)),
//                           child: const Text(
//                             "Veiw Map",
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         // Text(
//                         //   "Booked",
//                         //   style: TextStyle(
//                         //       fontSize: 15,
//                         //       color: Colors.orange,
//                         //       fontWeight: FontWeight.bold),
//                         // )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Carousels extends StatelessWidget {
//   const Carousels({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           child: Carousel(
//             autoplay: false,
//             dotSize: 4.0,
//             dotSpacing: 15.0,
//             dotColor: Colors.lightBlueAccent,
//             indicatorBgPadding: 5.0,
//             dotBgColor: Color.fromARGB(255, 100, 99, 100).withOpacity(0.5),
//             images: const [
//               AssetImage('assets/finallogo.png'),
//               AssetImage('assets/rr.png'),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 0,
//           right: 5,
//           child: Icon(
//             Icons.favorite,
//             color: Colors.red,
//           ),
//         ),
//         Positioned(
//           child: Icon(
//             Icons.star_rate_sharp,
//             color: Colors.white,
//           ),
//         )
//       ],
//     );
//   }
// }
