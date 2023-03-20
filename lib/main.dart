import 'package:flutter/material.dart';
import 'package:kotha_new/pages/homes.dart';
import 'package:kotha_new/pages/login.dart';
import 'package:kotha_new/pages/myHomepage.dart';
// import 'package:kotha_new/pages/login.dart';
import 'package:kotha_new/pages/searchPage.dart';
import 'package:kotha_new/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // '/': (context) => const Login(),
        // '/login': (context) => const Login(),
        '/homepage': (context) => const Homes(),
        // '/': (context) => const SearchPage(),
        '/signup': (context) => const Register(),
      },
      home: const Login(),
    );
  }
}
