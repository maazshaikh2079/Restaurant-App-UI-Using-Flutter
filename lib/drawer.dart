// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurantappui/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.white, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  accountEmail: Text(
                    "maazshaikh2079@gmail.com",
                    // "",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://i.ibb.co/njvMkpw/Formal-infront-dias-rbg.png"),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "Account",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.bell,
                  color: Colors.black,
                ),
                title: Text(
                  "Notifications",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.star,
                  color: Colors.black,
                ),
                title: Text(
                  "Favourite",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.creditcard,
                  color: Colors.black,
                ),
                title: Text(
                  "Payment",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.clock,
                  color: Colors.black,
                ),
                title: Text(
                  "History",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.settings_solid,
                  color: Colors.black,
                ),
                title: Text(
                  "Settings",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  "Help",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  "Contact Us",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.power,
                  color: Colors.black,
                ),
                title: Text(
                  "Log Out",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                  name = '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Padding buildContactAvatar(String name, String filename, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 25),
    child: GestureDetector(
      onTap: () {
        _showPopUp(context, name);
      },
      child: Column(
        children: [
          // UserAvatar(filename: filename),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

void _showPopUp(BuildContext context, String name) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Contact"),
        content: Text("You tapped on $name"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close", style: TextStyle(color: Colors.blueAccent)),
          ),
        ],
      );
    },
  );
}
