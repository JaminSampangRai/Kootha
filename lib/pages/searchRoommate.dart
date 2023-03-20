import 'package:flutter/material.dart';

class SearchRoomates extends StatefulWidget {
  const SearchRoomates({Key? key}) : super(key: key);

  @override
  State<SearchRoomates> createState() => _SearchRoomatesState();
}

class _SearchRoomatesState extends State<SearchRoomates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: const Color(0xff1d3b58),
        title: const Text(
          "Search For Roommates",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/R.png"),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "JOHN GURUNG",
                                style: TextStyle(
                                    color: Color(0xff1d3b58),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              //button icon to list in favourite
                              IconButton(
                                color: Colors.grey,
                                onPressed: () {},
                                icon: const Icon(Icons.favorite),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Student(24)",
                                style: TextStyle(
                                  color: Color(0xff1d3b58),
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.search,
                                    size: 15,
                                    color: Color(0xff1d3b58),
                                  ),
                                  Text(
                                    "Dharan",
                                    style: TextStyle(
                                      color: Color(0xff1d3b58),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Budget: 2000/month",
                                style: TextStyle(
                                  color: Color(0xff1d3b58),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "About",
                                style: TextStyle(
                                    color: Color(0xff1d3b58),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: const Text(
                              "I am a mobile app developer and i m searching for a roommate who has same interest as me.",
                              style: TextStyle(
                                color: Color(0xff1d3b58),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.call,
                                  color: Color(0xff1d3b58),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.chat,
                                  color: Color(0xff1d3b58),
                                ),
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
      ),
    );
  }
}
