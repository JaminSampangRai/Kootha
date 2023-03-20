import '../Repository/auth_repo.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final AuthRepository _repository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff1d3b58),
              Color(0xff1d3b58),
            ], begin: Alignment.topLeft, end: Alignment.centerRight),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "SIGNUP",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
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
                                labelText: 'Name',
                                labelStyle:
                                    const TextStyle(color: Color(0xff1d3b58)),
                                hintText: 'Enter Your Name',
                                focusColor: const Color(0xff1d3b58),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff1d3b58),
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color(0xff1d3b58),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailController,
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
                              labelText: 'E-mail',
                              labelStyle:
                                  const TextStyle(color: Color(0xff1d3b58)),
                              hintText: 'jaminsampang@gmail.com',
                              focusColor: const Color(0xff1d3b58),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff1d3b58),
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0xff1d3b58),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
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
                              labelText: 'Password',
                              labelStyle:
                                  const TextStyle(color: Color(0xff1d3b58)),
                              hintText: 'Enter Password',
                              focusColor: const Color(0xff1d3b58),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff1d3b58),
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Color(0xff1d3b58),
                              ),
                              // suffixIcon: IconButton(
                              //   icon: Icon(_obscureText
                              //       ? Icons.visibility_off
                              //       : Icons.visibility),
                              //   color: const Color(0xff1d3b58),
                              // ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
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
                              labelText: 'Confirm Password',
                              labelStyle:
                                  const TextStyle(color: Color(0xff1d3b58)),
                              hintText: 'Re-Enter Password',
                              focusColor: const Color(0xff1d3b58),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff1d3b58),
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Color(0xff1d3b58),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please re-enter your password.';
                              }
                              return null;
                            },
                          ),

                          //Confirm passowrd
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: InkWell(
                              child: Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xfff1d3b58),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  var registerData = {
                                    'name': nameController.value.text,
                                    'email': emailController.value.text,
                                    'password': passwordController.value.text,
                                    'confirmPassword':
                                        confirmPasswordController.value.text,
                                  };
                                  var response =
                                      await _repository.register(registerData);
                                  if (response == 200) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Registered successfull'),
                                      backgroundColor: Colors.green[300],
                                    ));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Login()));
                                  } else if (response == 401) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Email already registered'),
                                      backgroundColor: Colors.red[300],
                                    ));
                                  } else if (response == 402) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Phone already registered'),
                                      backgroundColor: Colors.red[400],
                                    ));
                                  } else if (response == 400) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Something went wrong'),
                                      backgroundColor: Colors.red[400],
                                    ));
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Text('Or'),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have account?",
                                style: TextStyle(color: Color(0xff1d3b58)),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()))
                                },
                                child: Text(
                                  "Login Now",
                                  style:
                                      TextStyle(color: Colors.blueAccent[700]),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




























// import 'dart:convert';

// import 'package:flutter/material.dart';
// // ignore: unused_import
// import 'package:http/http.dart' as http;
// import 'package:kotha_new/apiService.dart';
// import 'package:kotha_new/config.dart';
// import 'package:kotha_new/model/signup_request_model.dart';
// import 'package:kotha_new/model/signup_response_model.dart';
// import 'package:kotha_new/pages/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   late String _name;
//   late String _email;
//   late String _password;
//   bool _obscureText = true;
//   bool _termsAndConditions = false;
//   bool isAPIcallProcess = false;
//   GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmpasswordController = TextEditingController();

//   static Future<bool> signUp(SignupRequestModel model) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };
//     var url = Uri.http(Config.baseUrl, Config.signupAPI);
//     final client = http.Client();
//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );
//     var data = json.decode(response.body);
//     if (data['status'] == 201) {
//       return true;
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           constraints: BoxConstraints(
//             maxHeight: MediaQuery.of(context).size.height,
//             maxWidth: MediaQuery.of(context).size.width,
//           ),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color(0xff1d3b58),
//               Color(0xff1d3b58),
//             ], begin: Alignment.topLeft, end: Alignment.centerRight),
//           ),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "SIGNUP",
//                       style: TextStyle(
//                           fontSize: 45,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 7,
//                 child: Container(
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
//                     child: Form(
//                       key: globalFormKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: nameController,
//                             onChanged: (text) {
//                               setState(() {
//                                 _name = text;
//                               });
//                             },
//                             cursorColor: const Color(0xff1d3b58),
//                             style: const TextStyle(color: Color(0xff1d3b58)),
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(7.0),
//                                   borderSide: const BorderSide(
//                                       color: Color(0xff1d3b58),
//                                       width: 3.0,
//                                       style: BorderStyle.solid),
//                                 ),
//                                 labelText: 'Name',
//                                 labelStyle:
//                                     const TextStyle(color: Color(0xff1d3b58)),
//                                 hintText: 'Enter Your Name',
//                                 focusColor: const Color(0xff1d3b58),
//                                 focusedBorder: const OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0xff1d3b58),
//                                   ),
//                                 ),
//                                 prefixIcon: const Icon(
//                                   Icons.person,
//                                   color: Color(0xff1d3b58),
//                                 )),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: emailController,
//                             onChanged: (text) {
//                               setState(() {
//                                 _email = text;
//                               });
//                             },
//                             cursorColor: const Color(0xff1d3b58),
//                             style: const TextStyle(color: Color(0xff1d3b58)),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7.0),
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff1d3b58),
//                                     width: 3.0,
//                                     style: BorderStyle.solid),
//                               ),
//                               labelText: 'E-mail',
//                               labelStyle:
//                                   const TextStyle(color: Color(0xff1d3b58)),
//                               hintText: 'jaminsampang@gmail.com',
//                               focusColor: const Color(0xff1d3b58),
//                               focusedBorder: const OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xff1d3b58),
//                                 ),
//                               ),
//                               prefixIcon: const Icon(
//                                 Icons.email,
//                                 color: Color(0xff1d3b58),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: passwordController,
//                             onChanged: (text) {
//                               setState(() {
//                                 _password = text;
//                               });
//                             },
//                             obscureText: _obscureText,
//                             cursorColor: const Color(0xff1d3b58),
//                             style: const TextStyle(color: Color(0xff1d3b58)),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7.0),
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff1d3b58),
//                                     width: 3.0,
//                                     style: BorderStyle.solid),
//                               ),
//                               labelText: 'Password',
//                               labelStyle:
//                                   const TextStyle(color: Color(0xff1d3b58)),
//                               hintText: 'Enter Password',
//                               focusColor: const Color(0xff1d3b58),
//                               focusedBorder: const OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xff1d3b58),
//                                 ),
//                               ),
//                               prefixIcon: const Icon(
//                                 Icons.key,
//                                 color: Color(0xff1d3b58),
//                               ),
//                               suffixIcon: IconButton(
//                                 icon: Icon(_obscureText
//                                     ? Icons.visibility_off
//                                     : Icons.visibility),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscureText = !_obscureText;
//                                   });
//                                 },
//                                 color: const Color(0xff1d3b58),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: confirmpasswordController,
//                             obscureText: _obscureText,
//                             cursorColor: const Color(0xff1d3b58),
//                             style: const TextStyle(color: Color(0xff1d3b58)),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(7.0),
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff1d3b58),
//                                     width: 3.0,
//                                     style: BorderStyle.solid),
//                               ),
//                               labelText: 'Confirm Password',
//                               labelStyle:
//                                   const TextStyle(color: Color(0xff1d3b58)),
//                               hintText: 'Re-Enter Password',
//                               focusColor: const Color(0xff1d3b58),
//                               focusedBorder: const OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xff1d3b58),
//                                 ),
//                               ),
//                               prefixIcon: const Icon(
//                                 Icons.key,
//                                 color: Color(0xff1d3b58),
//                               ),
//                               suffixIcon: IconButton(
//                                 icon: Icon(_obscureText
//                                     ? Icons.visibility_off
//                                     : Icons.visibility),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscureText = !_obscureText;
//                                   });
//                                   // validator:
//                                   // (value) {
//                                   //   if (value != passwordController.text) {
//                                   //     return 'passwords do not match';
//                                   //   }
//                                   //   return null;
//                                   // };
//                                 },
//                                 color: const Color(0xff1d3b58),
//                               ),
//                             ),
//                           ),
//                           //Confirm passowrd
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.9,
//                             child: TextButton(
//                               onPressed: () async {
//                                 if (validateAndSave()) {
//                                   setState(() {
//                                     isAPIcallProcess = false;
//                                   });
//                                   // SignupRequestModel model = SignupRequestModel(
//                                   //   name: nameController.text,
//                                   //   email: emailController.text,
//                                   //   password: passwordController.text,
//                                   // );
//                                   if (emailController.text.isEmpty ||
//                                       nameController.text.isEmpty ||
//                                       passwordController.text.isEmpty) {
//                                     showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                           title: const Center(
//                                               child: Text("Error")),
//                                           content: const Text(
//                                               "email or password  Name cannot be empty"),
//                                           actions: [
//                                             TextButton(
//                                                 onPressed: (() {
//                                                   Navigator.of(context).pop();
//                                                 }),
//                                                 child: const Text("ok"))
//                                           ],
//                                         );
//                                       },
//                                     );
//                                     return;
//                                   }
//                                   SignupRequestModel model = SignupRequestModel(
//                                     name: nameController.text,
//                                     email: emailController.text,
//                                     password: passwordController.text,
//                                   );
//                                   SignupResponseModel signupResponse =
//                                       await APIService.signup(model);
//                                   if (signupResponse.user != null) {
//                                     Navigator.push(
//                                         (context),
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const Login()));
//                                   } else if (signupResponse.status == 409) {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext contect) {
//                                           return AlertDialog(
//                                             title: const Center(
//                                                 child: Text("Error")),
//                                             content: const Text(
//                                                 "User Already Exist"),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: (() {
//                                                   Navigator.of(context).pop();
//                                                 }),
//                                                 child: const Text("Ok"),
//                                               ),
//                                             ],
//                                           );
//                                         });
//                                   } else {
//                                     showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return AlertDialog(
//                                             title: const Center(
//                                                 child: Text("Error")),
//                                             content: const Text(
//                                                 "Error from The server"),
//                                             actions: [
//                                               TextButton(
//                                                   onPressed: (() {
//                                                     Navigator.of(context).pop();
//                                                   }),
//                                                   child: const Text("OK"))
//                                             ],
//                                           );
//                                         });
//                                   }

//                                   //
//                                   //save user data
//                                   // await _saveUserData();
//                                   // Navigator.pushReplacementNamed(
//                                   //     context, "/profile");
//                                 }
//                               },
//                               //end of on pressed
//                               style: TextButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                   elevation: 2,
//                                   backgroundColor: const Color(0xff1d3b58)),
//                               child: const Text(
//                                 "SignUp",
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                             ),
//                           ),
//                           //this is for button
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           CheckboxListTile(
//                             value: _termsAndConditions,
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 _termsAndConditions = value!;
//                               });
//                             },
//                             controlAffinity: ListTileControlAffinity.leading,
//                             activeColor: const Color(0xff1d3b58),
//                             autofocus: true,
//                             title: const Text(
//                               'I accept the terms and conditions',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 color: Colors.blueGrey,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool validateAndSave() {
//     final form = globalFormKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<void> _saveUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("name", _name);
//     await prefs.setString("email", _email);
//     await prefs.setString("password", _password);
//   }
// }





//     //                                     // APIService.signup(model).then((response) {
//                                 //     // if (emailController.text.isEmpty ||
//                                 //     //     nameController.text.isEmpty ||
//                                 //     //     passwordController.text.isEmpty) {
//                                 //     //   showDialog(
//                                 //     //     context: context,
//                                 //     //     builder: (BuildContext context) {
//                                 //     //       return AlertDialog(
//                                 //     //         title: const Center(
//                                 //     //             child: Text("Error")),
//                                 //     //         content: const Text(
//                                 //     //             "email or password  Name cannot be empty"),
//                                 //     //         actions: [
//                                 //     //           TextButton(
//                                 //     //               onPressed: (() {
//                                 //     //                 Navigator.of(context).pop();
//                                 //     //               }),
//                                 //     //               child: const Text("ok"))
//                                 //     //         ],
//                                 //     //       );
//                                 //     //     },
//                                 //     //   );
//                                 //     //   return;
//                                 //     // }
//                                 //     if (response.user != null) {
//                                 //       FormHelper.showSimpleAlertDialog(
//                                 //           context,
//                                 //           Config.appName,
//                                 //           "Registration Successful ",
//                                 //           "OK", () {
//                                 //         Navigator.push(
//                                 //             (context),
//                                 //             MaterialPageRoute(
//                                 //                 builder: (context) =>
//                                 //                     const Login()));
//                                 //       });
//                                 //     } else {
//                                 //       FormHelper.showSimpleAlertDialog(
//                                 //           context,
//                                 //           Config.appName,
//                                 //           "Invalid Username or Password ",
//                                 //           "OK", () {
//                                 //         Navigator.pop(context);
//                                 //       });
//                                 //     }
//                                 //   });
//                                 // }

//                                 // var data = APIService.signup();

//                                 // if (emailController.text.isEmpty ||
//                                 //     nameController.text.isEmpty ||
//                                 //     passwordController.text.isEmpty) {
//                                 //   showDialog(
//                                 //     context: context,
//                                 //     builder: (BuildContext context) {
//                                 //       return AlertDialog(
//                                 //         title:
//                                 //             const Center(child: Text("Error")),
//                                 //         content: const Text(
//                                 //             "email or password  Name cannot be empty"),
//                                 //         actions: [
//                                 //           TextButton(
//                                 //               onPressed: (() {
//                                 //                 Navigator.of(context).pop();
//                                 //               }),
//                                 //               child: const Text("ok"))
//                                 //         ],
//                                 //       );
//                                 //     },
//                                 //   );
//                                 //   return;
//                                 // }

//                                 // SignupRequestModel model = SignupRequestModel(
//                                 //     name: nameController.text,
//                                 //     email: emailController.text,
//                                 //     password: passwordController.text);
//                                 // bool res = await signUp(model);
//                                 // print(res);
//                                 // if (res == true) {
//                                 //   Navigator.push(
//                                 //       (context),
//                                 //       MaterialPageRoute(
//                                 //           builder: (context) => const Login()));
//                                 // } else if (res == false) {
//                                 //   showDialog(
//                                 //       context: context,
//                                 //       builder: (BuildContext context) {
//                                 //         return AlertDialog(
//                                 //           title: const Center(
//                                 //               child: Text("Error")),
//                                 //           content:
//                                 //               const Text("User already exists"),
//                                 //           actions: [
//                                 //             TextButton(
//                                 //                 onPressed: (() {
//                                 //                   Navigator.of(context).pop();
//                                 //                 }),
//                                 //                 child: const Text("Ok"))
//                                 //           ],
//                                 //         );
//                                 //       });
//                                 // } else {
//                                 //   showDialog(
//                                 //       context: context,
//                                 //       builder: (BuildContext context) {
//                                 //         return AlertDialog(
//                                 //           title: const Center(
//                                 //               child: Text("Error")),
//                                 //           content: const Text(
//                                 //               "Error from the server"),
//                                 //           actions: [
//                                 //             TextButton(
//                                 //                 onPressed: (() {
//                                 //                   Navigator.of(context).pop();
//                                 //                 }),
//                                 //                 child: const Text("Ok"))
//                                 //           ],
//                                 //         );
//                                 //       });
//                                 // }
//                                 // APIService.signup(model).then((response) {
//                                 //   setState(() {
//                                 //     isAPIcallProcess = false;
//                                 //   });

//                                 // if (response.token== null) {
//                                 //   print(response);
//                                 // } else {
//                                 //   print("response is either null or empty");
//                                 // }
//                                 // if (response.user != null) {
//                                 //   FormHelper.showSimpleAlertDialog(
//                                 //     context,
//                                 //     Config.appName,
//                                 //     "Register Successful.",
//                                 //     "Ok",
//                                 //     () {
//                                 //       Navigator.pushNamedAndRemoveUntil(
//                                 //         context,
//                                 //         "/login",
//                                 //         (route) => false,
//                                 //       );
//                                 //     },
//                                 //   );
//                                 // } else {
//                                 //   FormHelper.showSimpleAlertDialog(
//                                 //     context,
//                                 //     Config.appName,
//                                 //     "Invalid Username/Pasword ",
//                                 //     "Ok",
//                                 //     () {
//                                 //       Navigator.pop(context);
//                                 //     },
//                                 //   );
//                                 // }
//                                 // if (response.isEmpty) {
//                                 //   showDialog(
//                                 //       context: context,
//                                 //       builder: (BuildContext context) {
//                                 //         return AlertDialog(
//                                 //           title: const Center(
//                                 //               child: Text("Error")),
//                                 //           content: const Text(
//                                 //               "User already exists"),
//                                 //           actions: [
//                                 //             TextButton(
//                                 //                 onPressed: (() {
//                                 //                   Navigator.of(context).pop();
//                                 //                 }),
//                                 //                 child: const Text("ok")),
//                                 //           ],
//                                 //         );
//                                 //       });
//                                 // } else {
//                                 //   showDialog(
//                                 //     context: context,
//                                 //     builder: (BuildContext context) {
//                                 //       return AlertDialog(
//                                 //         title: const Center(
//                                 //             child: Text("Error")),
//                                 //         content: const Text(
//                                 //             " error form the server"),
//                                 //         actions: [
//                                 //           TextButton(
//                                 //               onPressed: (() {
//                                 //                 Navigator.of(context).pop();
//                                 //               }),
//                                 //               child: const Text("ok"))
//                                 //         ],
//                                 //       );
//                                 //     },
//                                 //   );
//                                 // }
//                                 // });
//                                 // if (response.data! == null) {
//                                 //   Navigator.push(
//                                 //       (context),
//                                 //       MaterialPageRoute(
//                                 //           builder: (context) => const Login()));
//                                 // if (response.data == null) {
//                                 //   showDialog(
//                                 //       context: context,
//                                 //       builder: (BuildContext context) {
//                                 //         return AlertDialog(
//                                 //           title: const Center(
//                                 //               child: Text("Error")),
//                                 //           content:
//                                 //               const Text("User already exists"),
//                                 //           actions: [
//                                 //             TextButton(
//                                 //                 onPressed: (() {
//                                 //                   Navigator.of(context).pop();
//                                 //                 }),
//                                 //                 child: const Text("ok")),
//                                 //           ],
//                                 //         );
//                                 //       });
//                                 // } else {
//                                 //   showDialog(
//                                 //     context: context,
//                                 //     builder: (BuildContext context) {
//                                 //       return AlertDialog(
//                                 //         title:
//                                 //             const Center(child: Text("Error")),
//                                 //         content: const Text(
//                                 //             " error form the server"),
//                                 //         actions: [
//                                 //           TextButton(
//                                 //               onPressed: (() {
//                                 //                 Navigator.of(context).pop();
//                                 //               }),
//                                 //               child: const Text("ok"))
//                                 //         ],
//                                 //       );
//                                 //     },
//                                 //   );
//                                 // }

