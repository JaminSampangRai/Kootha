import 'package:flutter/material.dart';

import 'package:kotha_new/pages/homes.dart';

import 'package:kotha_new/pages/searchRoommate.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1d3b58),
                Color(0xff1d3b58),
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      Center(
                        child: Image(
                          image: const AssetImage('assets/finallogo.png'),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: const Color(0xff1d3b58)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homes(
                                        // imageUrls: const [
                                        //   "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400",
                                        //   "https://images.pexels.com/photos/906023/pexels-photo-906023.jpeg?auto=compress&cs=tinysrgb&w=400",
                                        //   "https://images.pexels.com/photos/1789968/pexels-photo-1789968.jpeg?auto=compress&cs=tinysrgb&w=400",
                                        // ],
                                        )));
                          },
                          child: const Text(
                            "Search For Room",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: const Color(0xff1d3b58)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchRoomates()));
                          },
                          child: const Text(
                            "Search For Roommate",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
