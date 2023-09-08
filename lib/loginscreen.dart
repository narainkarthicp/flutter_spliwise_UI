//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:splitwise_loginpage/colors.dart';
import 'package:splitwise_loginpage/home_screen.dart';

import 'constVariable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? _email, _password;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      //   backgroundColor: Colors.black38,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey, // to check saved||un or valid||un
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      bgImage,
                      height: height * 0.40,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.41,
                      width: width,
                      // color: Colors.amber.withOpacity(.2),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.1, 10],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.white])),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    appName,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    mozhi,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 19),
                  child: Container(
                    child: Text(
                      "  $Loginstr  ",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [primaryColor, primaryColor.withOpacity(.2)],
                        ),
                        border: Border(
                            left: BorderSide(
                                color: Color.fromARGB(255, 7, 188, 182),
                                width: 5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value;
                    },
                    validator: (email) {
                      if (email == null || email.isEmpty)
                        return "Enter valid mail";
                      else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email))
                        return "provide valid mail ";
                      else
                        return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: primaryColor,
                        ),
                        labelText: " E-MAIL ADDRESS",
                        labelStyle: TextStyle(color: primaryColor)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value;
                    },
                    validator: ((password) {
                      if (password == null || password.isEmpty)
                        return "Enter the pasword";
                      else if (password.length < 8) return "week password";
                      return null;
                    }),
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: primaryColor,
                        ),
                        labelText: " PASSWORD",
                        labelStyle: TextStyle(color: primaryColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget password?",
                            style: TextStyle(color: primaryColor),
                          ))),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Processing Data')));
                          formKey.currentState!.save();
                          if (_email == "narainkarthicp@gmail.com" ||
                              _password == "123456789") {
                            print("we did");
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => homeScreen(),
                              ),
                            );
                          } else {
                            print("INVALID");
                          }
                        }
                      },
                      child: Text(
                        "Login to Account",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: Color.fromARGB(255, 224, 221, 221),
                          backgroundColor: primaryColor,
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have Account ?"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "   create account !!",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.amber[900]),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
