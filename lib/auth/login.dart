// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

import '../api/backend.dart';
import '../component/dimension.dart';
import '../pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          height: double.maxFinite,
          width: double.maxFinite,
          // decoration: const BoxDecoration(color: Colors.white),
          // child: Image.asset(
          //   "assets/img/neon.jpg",
          //   fit: BoxFit.cover,
          // ),
        ),
        Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Row(
              children: [
                currentWidth <= 620
                    ? const SizedBox()
                    : Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          // Container(
                          //   padding: EdgeInsets.only(top: 40),
                          //   child: AspectRatio(
                          //     aspectRatio: 1,
                          //     child:
                          //         Image.asset('assets/discover.png', fit: BoxFit.cover),
                          //   ),
                          // ),
                          Container(
                            height: double.maxFinite,
                            width: currentWidth < desktopWidth
                                ? currentWidth / 4
                                : currentWidth / 2.5,
                            // currentWidth / 4,

                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Image.asset(
                              "assets/img/neon.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(300.0),
                                    color: Colors.lightBlue),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40.0),
                                    child: Image.asset(
                                        'assets/img/box-flat/512x512.png',
                                        height: 120,
                                        width: 120),
                                  ),
                                ),
                              ),
                              currentWidth <= desktopWidth
                                  ? const SizedBox()
                                  : const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "INVENTORY",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                    ),
                              currentWidth <= desktopWidth
                                  ? const SizedBox()
                                  : Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 300),
                                      child: const Divider(
                                        color: Colors.black45,
                                        thickness: 2.5,
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        // child: Image.asset(
                        //   "assets/img/neon.jpg",
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, bottom: 70, top: 70),
                        child: Container(
                          width: double.maxFinite,
                          constraints: const BoxConstraints(
                              maxWidth: 600, maxHeight: 600),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(2, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent)
                                    // child: Image.asset(
                                    //   "assets/img/neon.jpg",
                                    //   fit: BoxFit.cover,
                                    // ),
                                    ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),

                                  currentWidth <= desktopWidth
                                      ? Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "INVENTORY",
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                        )
                                      : const SizedBox(),

                                  // const Padding(
                                  //   padding: EdgeInsets.all(15.0),
                                  //   child: Text(
                                  //     "INVENTORY",
                                  //     style: TextStyle(
                                  //         fontFamily: "NexaBold", fontSize: 30),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10.0),
                                    child: Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 500),
                                      child: TextField(
                                        controller: _userController,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.lightBlue),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          // prefixIcon: const Icon(
                                          //   Icons.person,
                                          //   color: Colors.blueGrey,
                                          // ),
                                          hintText: 'Email',
                                          hintStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          fillColor: Colors.grey[200],
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10.0),
                                    child: Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 500),
                                      child: TextField(
                                        controller: _passwordController,
                                        obscureText: _isObscure,
                                        enableSuggestions: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.lightBlue),
                                            borderRadius:
                                                BorderRadius.circular(12),
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
                                          hintStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          fillColor: Colors.grey[200],
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: double.maxFinite,
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0, vertical: 10.0),
                                        child: Text(
                                          "Forgot Password ?",
                                          style: TextStyle(
                                              color: Colors.blue[600],
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          fixedSize: Size.fromHeight(50),
                                          backgroundColor: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      autofocus: true,
                                      onPressed: login,
                                      child: const Center(
                                        child: Text(
                                          'LOG IN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "NexaBold",
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Create new account? ",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 20),
                                        ),
                                        GestureDetector(
                                          // onTap: forgotpass,
                                          child: Text(
                                            "Sign up",
                                            style: TextStyle(
                                                color: Colors.blue[600],
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future login() async {
    String email = _userController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      await FlutterPlatformAlert.playAlertSound(
        iconStyle: IconStyle.exclamation,
      );
      FlutterPlatformAlert.showAlert(
        iconStyle: IconStyle.warning,
        windowTitle: 'Username or Password is Empty !',
        text: '',
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      var message = await ApiService.loginApiRequest(email, password);
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
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
