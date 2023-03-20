// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kotha_new/pages/Chat.dart';
import 'package:kotha_new/pages/favourite.dart';
import 'package:kotha_new/pages/myHomepage.dart';
import 'package:kotha_new/pages/Rooms/postRoom.dart';
import 'package:kotha_new/pages/searchRoommate.dart';

// import '../model/room_model.dart';

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  int _currentIndex = 0;
  final List _screens = [
    RoomCard(),
    PostRoom(),
    Favourite(),
    ChatUI(),
    SearchRoomates()
  ];
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff1d3b58),
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          selectedItemColor: const Color.fromARGB(255, 58, 222, 255),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded), label: "Post Room"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_search_outlined), label: "Roommate"),
          ],
        ),
        body: _screens[_currentIndex]);
  }
}
