// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_field, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String name = "";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, "/home");
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "images/foodlogin.png",
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36), -> Standard
              // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15), -> Oppo A31
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      // borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          // color: Colors.red.shade400,
                          color: Colors.black,
                        ),
                      ),
                      icon: Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.black,
                      ),
                      hintText: "Enter Username",
                      labelText: "Username",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        // color: Colors.red.shade400,
                        color: Colors.black,
                      ),
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(8),
                      // borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 2,
                          // color: Colors.red.shade400,
                          color: Colors.black,
                        ),
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: "Enter Password",
                      labelText: "Password",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        // color: Colors.red.shade400,
                        color: Colors.black,
                      ),
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
