// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/style.dart';

class ReachUS extends StatefulWidget {
  ReachUS({Key key}) : super(key: key);

  @override
  _ReachUSState createState() => _ReachUSState();
}

class _ReachUSState extends State<ReachUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AppBars().commonAppBar(context, "Reach us"),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    // child: Container(
                    //     color: Colors.grey,
                    //     child: Center(child: Text("Your asset"))),
                    //delete the just above code [ child container ] and uncomment the below code and set your assets
                    child: Image.asset(
                      'assets/images/map.JPG',
                      fit: BoxFit.cover,
                    )

                )),
          ),
          Positioned(
            bottom: -4,
            left: 5,
            right: 5,
            child: Container(
                height: 160,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "We are here...",
                          style: kTitleStyle3,
                        ),
                        Text(
                            "Front of Old, Pratap Talkies Rd, opp. Care N Cure Hospital, Pratap Chowk, Bilaspur, Chhattisgarh 495001",
                            style: kTitleStyle4),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: appBarColor,
                            child: Center(
                                child: Text("Contact Us",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/ContactUsPage');
                            })
                      ],
                    ),
                  ),
                )),
          ),
          Positioned(
            right: 25,
            bottom: 125,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: setbtnColor,
              child: Icon(
                Icons.near_me,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
