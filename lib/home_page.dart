// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restaurantappui/drawer.dart';

var bannerItems = ["Pizza", "Burger", "Cheese Chilly", "Noodles", "Geleto"];
var bannerOffers = [
  "Flate 20% Off",
  "More than 40% Off",
  "Flate 35% Off",
  "Free Coke Can",
  "More than 15% Off"
];
var bannerImage = [
  "images/pizza.jpg",
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/Sassy_Spoon.jpg"
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = [];
      String dataString =
          await DefaultAssetBundle.of(context).loadString("data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      for (var object in dataJSON) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        for (var item in dataList) {
          // finalString = finalString + item + " | ";
          finalString = finalString + item + " | ";
        }

        items.add(Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Text(
                            finalString,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          "Min. Order: ${object["minOrder"]}",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      }

      return items;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Master Chef's Lounge",
          style: TextStyle(fontSize: 50, fontFamily: "Samantha"),
        ),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        backgroundColor: Colors.red.shade400,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              ),
              BannerWidgetArea(),
              Container(
                  child: FutureBuilder<List<Widget>>(
                future: createList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error loading data: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    // Perform a null check before using snapshot.data
                    final List<Widget> data = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: data,
                      ),
                    );
                  } else {
                    return Text('No data available');
                  }
                },
              ))
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red.shade400,
          child: Icon(
            MdiIcons.food,
            color: Colors.white,
          )),
      drawer: MyDrawer(),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 2);

    List<Widget> banners = [];

    for (int i = 0; i < bannerItems.length; i++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  bannerImage[i],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87])),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[i],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
                      bannerOffers[i],
                      // "More than 40% Off",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
