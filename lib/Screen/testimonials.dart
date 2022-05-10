// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/style.dart';

class Testimonials extends StatefulWidget {
  Testimonials({Key key}) : super(key: key);

  @override
  _TestimonialsState createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  ScrollController _scrollController = ScrollController();
  List<String> _testiprofileimg = [
    "assets/images/testi1.jpg",
    "assets/images/testi1.jpg",
    "assets/images/testi1.jpg",
    "assets/images/testi1.jpg",
    "assets/images/testi1.jpg",
    "assets/images/testi1.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AppBars().commonAppBar(context, "Testimonials"),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _testiprofileimg.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return _card(_testiprofileimg[index]);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(String profile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 10, left: 10),
      child: Stack(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 50, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          "One of the best dentist in the country, Dr.Vaibhav Choudhary treated me with great efficiency. Thanks a lot to him for a great",
                          style: kTitleStyle10),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("- Vinay Shahu"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                radius: 35,
                child: ClipOval(
                    // child: Container(
                    //     color: Colors.grey,
                    //     child: Center(child: Text("Your asset"))),
                    //delete the just above code [ child container ] and uncomment the below code and set your assets
                    child: Image.asset(
                  profile,
                  fit: BoxFit.fill,
                  height: double.maxFinite,
                  width: double.maxFinite,
                )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Box {}
