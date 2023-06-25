// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:http/http.dart' as http;
import '../component/square_tile.dart';
import '../pages/home.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _isObscure = true;

  Future login() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    String email = _emailController.text;
    String password = _passController.text;
// SERVER LOGIN API URL
    var url = Uri.parse('http://localhost/inventory_api/api.php');
    // Store all data with Param Name.
    var data = {'username': email, 'password': password};
    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    if (message == 'Login Matched') {
      Navigator.of(context).pop(false);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Welcome"),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      Navigator.of(context).pop(false);
      await FlutterPlatformAlert.playAlertSound(
        iconStyle: IconStyle.error,
      );
      FlutterPlatformAlert.showAlert(
        iconStyle: IconStyle.error,
        windowTitle: 'Username or Password Incorrect',
        text: '',
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final currentWidth = MediaQuery.of(context).size.width;
    // final bool isKeyboardVisible =
    //     KeyboardVisibilityProvider.isKeyboardVisible(context);
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        // onTap: forgotpass,
        child: SizedBox(
          height: 30,
          child: BottomAppBar(
            color: Colors.grey[400],

            // ignore: sort_child_properties_last
            // child: Center(
            //     child: Text(
            //   'Ketchan © 2023',
            //   style: TextStyle(color: Colors.grey[600]),
            // )),
            elevation: 0,
          ),
        ),
      ),
      // backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Container(
              height: 600,

              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              width: double.maxFinite,
              child: Column(
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 20),
                  //   child: Text(
                  //     "Inventory",
                  //     style: TextStyle(fontFamily: "NexaBold"),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300.0),
                        color: Colors.lightBlue),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset('assets/img/box-flat/512x512.png',
                            height: 100, width: 100),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "INVENTORY",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _emailController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // prefixIcon: const Icon(
                        //   Icons.person,
                        //   color: Colors.blueGrey,
                        // ),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _passController,
                      obscureText: _isObscure,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // prefixIcon: const Icon(
                        //   Icons.key,
                        //   color: Colors.blueGrey,
                        // ),
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: login,
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(color: Colors.blue[600]),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        String id = _emailController.text.trim();
                        String pass = _passController.text.trim();

                        if (id.isEmpty) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please Enter Email"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else if (pass.isEmpty) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please Enter Password"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          login();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "NexaBold",
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Divider(
                  //           thickness: 0.5, color: Colors.grey[400]),
                  //     ),
                  //     Text(
                  //       "sign in with",
                  //       style: TextStyle(color: Colors.grey[600]),
                  //     ),
                  //     Expanded(
                  //       child: Divider(
                  //           thickness: 0.5, color: Colors.grey[400]),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //         onTap: login,
                  //         child: const SquareTile(
                  //             imagePath: 'assets/img/google.png')),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     GestureDetector(
                  //         onTap: login,
                  //         child: const SquareTile(
                  //             imagePath: 'assets/img/fb.png')),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "create new account? ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        GestureDetector(
                          onTap: login,
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue[600]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
