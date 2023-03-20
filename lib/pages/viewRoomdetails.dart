// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Viewroomdetail extends StatefulWidget {
  const Viewroomdetail({Key? key}) : super(key: key);

  @override
  State<Viewroomdetail> createState() => _ViewroomdetailState();
}

class _ViewroomdetailState extends State<Viewroomdetail> {
  int _currentPage = 0;
  List<Widget> imglist = [
    Image.asset('assets/rr.png'),
    Image.asset('assets/finallogo.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: -1,
        centerTitle: true,
        title: const Text(
          "Room Details",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(0xff1d3b58),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 180.0,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    // itemCount: widget.imageUrls.length,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      //container for images
                      return Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                // NetworkImage(widget.imageUrls[index]),
                                AssetImage("assets/rr.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 2.0, top: 2.0),
                  color: const Color.fromARGB(255, 141, 146, 147),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3,
                        // widget.imageUrls.length,
                        (index) {
                      return Container(
                        height: 8.0,
                        width: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? const Color(0xff1d3b58)
                                : Colors.white.withOpacity(0.8)),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      RatingStars(
                        starCount: 5,
                        starSize: 20,
                        starSpacing: 2,
                        starOffColor: Color.fromARGB(255, 167, 166, 166),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 196, 200, 203)),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(27.5),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.wifi,
                                        size: 33,
                                        color: Color(0xff1d3b58),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Wifi",
                                    style: TextStyle(color: Color(0xff1d3b58)),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(27.5),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.local_parking_rounded,
                                        size: 33,
                                        color: Color(0xff1d3b58),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Parking",
                                    style: TextStyle(color: Color(0xff1d3b58)),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(27.5),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.water_drop_rounded,
                                        size: 33,
                                        color: Color(0xff1d3b58),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Water",
                                    style: TextStyle(color: Color(0xff1d3b58)),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(27.5),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.bed,
                                        size: 33,
                                        color: Color(0xff1d3b58),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Room",
                                    style: TextStyle(color: Color(0xff1d3b58)),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(27.5),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.kitchen,
                                        size: 33,
                                        color: Color(0xff1d3b58),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Kitchen",
                                    style: TextStyle(color: Color(0xff1d3b58)),
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Description",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff1d3b58)),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 196, 200, 203),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 196, 200, 203),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.call),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 2,
                          backgroundColor: const Color(0xff1d3b58)),
                      child: const Text(
                        "Rent Now",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const Icon(Icons.chat),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
