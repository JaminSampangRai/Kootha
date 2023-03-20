import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedGender = 'Male';
  late String _name = "";
  // late String _gender = "";
  late String _contactNo = "";
  late String _email = "";
  late String _password = "";
  late String _city = "";
  late String _budget = "";
  late String _profession = "";
  late String _description = "";
  late int _age = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _getUserData();
  // }
  @override
  void initState() {
    super.initState();
    _age = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        backgroundColor: const Color(0xff1d3b58),
        centerTitle: true,
        title: const Text("Profile"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Perform the action when the button is pressed
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 253,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Color(0xff1d3b58)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.photo_camera,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      // Text(
                      //   "Edit",
                      //   style: TextStyle(color: Colors.white, fontSize: 12),
                      // ),

                      SizedBox(
                        height: 36,
                        width: MediaQuery.of(context).size.width,
                        // decoration: const BoxDecoration(
                        //   borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(10),
                        //     topRight: Radius.circular(10),
                        //     bottomLeft: Radius.circular(10),
                        //     bottomRight: Radius.circular(10),
                        //   ),

                        //   // Color(0xfff1d3b58),
                        //   // color: Colors.white,
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Logout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                                // color: Color(0xff1d3b58),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Card(
                elevation: 5,
                child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_name),
                            Text(
                              _name,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showNameUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_email),
                            Text(
                              _email,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showEmailUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_email),
                            Text(
                              '*' * _password.length,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showPasswordUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Card(
                elevation: 5,
                child: Container(
                  height: 455,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Searching Parameters",
                          style: TextStyle(
                              color: Color(0xFF1d3b58),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Age",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_name),
                            Text(
                              _age.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showAgeUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Gender",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              _selectedGender,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showGenderUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "City",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_name),
                            Text(
                              _city,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showCityUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Budget/month",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_email),
                            Text(
                              _budget,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showBudgetUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Profession",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_email),
                            Text(
                              _profession,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showProfessionUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Contact No",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // Text(_email),
                            Text(
                              _contactNo,
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                _showContactUpdateDialog(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Description about you",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                // Text(_email),

                                IconButton(
                                  onPressed: () {
                                    _showDescriptionUpdateDialog(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 17,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: Text(
                                  _description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 4,
            // ),
            // Container(
            //     height: 50,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //           bottomLeft: Radius.circular(10),
            //           bottomRight: Radius.circular(10),
            //         ),
            //         color: Color(0xfff1d3b58)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         const Text(
            //           "Logout",
            //           style: TextStyle(color: Colors.white, fontSize: 14),
            //         ),
            //         IconButton(
            //             onPressed: () {},
            //             icon: const Icon(
            //               Icons.logout_rounded,
            //               color: Colors.white,
            //               size: 30,
            //             )),
            //       ],
            //     )),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }

  void _showNameUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Name'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              controller: TextEditingController(
                text: _name,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void _showEmailUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Email'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              controller: TextEditingController(
                text: _email,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void _showPasswordUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Password'),
          content: TextFormField(
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            controller: TextEditingController(
              text: _password,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Update"))
          ],
        );
      },
    );
  }

  void _showGenderUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Gender'),
          content: Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: "Male",
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  const Text("Male"),
                  Radio(
                    value: "Female",
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  const Text("Female"),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _showCityUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update City'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _city = value;
                });
              },
              controller: TextEditingController(
                text: _city,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void _showAgeUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Age'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _age = int.parse(value);
                });
              },
              controller: TextEditingController(
                text: _age.toString(),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void _showBudgetUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Budget'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _budget = value;
                });
              },
              controller: TextEditingController(
                text: _budget,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void _showProfessionUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Profession'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _profession = value;
                });
              },
              controller: TextEditingController(
                text: _profession,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void _showContactUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Contact'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _contactNo = value;
                });
              },
              controller: TextEditingController(
                text: _contactNo,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void _showDescriptionUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update Discription'),
            content: TextFormField(
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              controller: TextEditingController(
                text: _description,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  // Future<void> _getUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _name = prefs.getString("name") ?? "";
  //     _email = prefs.getString("email") ?? "";
  //     _password = prefs.getString("password") ?? "";
  //   });
  // }

  // void _logout() {
  //   // Add your logout logic here
  // }
}
