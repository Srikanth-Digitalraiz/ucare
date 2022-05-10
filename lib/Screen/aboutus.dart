// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/curverdpath.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/curverdpath.dart';
import 'package:ucare/utilites/style.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              //color: Colors.red,
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
            Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Contact Us",
                      style: kTitleStyle2,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        })
                  ],
                )),
            Positioned(
              top: 70,
              left: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        // child: Container(
                        //     color: Colors.grey,
                        //     child: Center(child: Text("Your asset"))),
                        //delete the just above code [ child container ] and uncomment the below code and set your assets
                        child: Image.network('https://images.pexels.com/photos/6129041/pexels-photo-6129041.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', fit: BoxFit.cover, filterQuality: FilterQuality.high,),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Dr Vaibhavi  Choudhary",
                          style: kTitleStyle3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("BDS", style: kTitleStyle3),
                      ),
                      Row(
                        children: <Widget>[
                          // Container(
                          //   height: 50,
                          //   width: 50,
                          //   child: Card(
                          //       color: Colors.grey,
                          //       child: Center(child: Text("Your asset"))),
                          // ),
                          // Container(
                          //   height: 50,
                          //   width: 50,
                          //   child: Card(
                          //       color: Colors.grey,
                          //       child: Center(child: Text("Your asset"))),
                          // ),
                          // Container(
                          //   height: 50,
                          //   width: 50,
                          //   child: Card(
                          //       color: Colors.grey,
                          //       child: Center(child: Text("Your asset"))),
                          // ),
                          //delete the just above code [ all three containers ] and uncomment the below code and set your assets
                          _cardIcon(Icons.chat, chartbackColor, chaticoncolor),
                          _cardIcon(
                              Icons.local_phone, callbgkColor, calliconcolor),
                          _cardIcon(
                              Icons.video_call, videobgkColor, videoiconcolor),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),

        // ListTile(
        //   title: Text(
        //     "Dr Vaibhav  Choudhary",
        //     style: kTitleStyle3,
        //   ),
        //   subtitle: Text(
        //     "Teeth Specialist",
        //     style: kTitleStyle4,
        //   ),
        //   trailing: Icon(Icons.favorite, color: calliconcolor),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 80),
          child: Text(
            "Among the finest BDS in the city, Adhishree Dental Clinic in Bilaspur H O, Bilaspur-chhattisgarh is known for offering excellent patient care. The clinic is located centrally in Bilaspur H O, a prominent locality in the city. I",
            style: kTitleStyle5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 25.0, right: 25),
          child: Text("Location", style: kTitleStyle3),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .45,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 5.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),

                      // child: Container(
                      //     color: Colors.grey,
                      //     child: Center(child: Text("Your asset"))),
                      //delete the just above code [ child container ] and uncomment the below code and set your assets
                      child: Image.network('https://images.pexels.com/photos/21014/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          fit: BoxFit.fill),
                    ),
                  )),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.place, size: 20, color: Colors.grey),
                            Expanded(
                              child: Text(
                                "Front of MVS School",
                                style: kTitleStyle5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today,
                                size: 20, color: Colors.grey),
                            Text("Mon-Sat")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.access_time,
                                size: 20, color: Colors.grey),
                            Text("9Am-7PM")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.phone, size: 20, color: Colors.grey),
                            Text("1234567890")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    )));
  }

  Widget _cardIcon(IconData icon, Color backColor, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width * .15,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: backColor,
          child: Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}
