// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/curverdpath.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/curverdpath.dart';
import 'package:ucare/utilites/style.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 8.0, bottom: 8.0),
            child: SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: appBarColor,
                  child: Center(
                      child: Text("Send Message",
                          style: TextStyle(
                            color: Colors.white,
                          ))),
                  onPressed: () {}),
            ),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: bgColor,
            child: Column(
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
                                  print(ModalRoute.of(context).settings.name);
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/'));
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
                                //  child: Center(child: Text("Your asset"))),
                                //delete the just above code [ child container ] and uncomment the below code and set your assets
                                // child: Image.asset(
                                //   'assets/images/dr.png',
                                //   fit: BoxFit.fill,
                                // )
                                 child: Image.network('https://images.pexels.com/photos/6129041/pexels-photo-6129041.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', fit: BoxFit.cover, filterQuality: FilterQuality.high,),

                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "Dr Vaibhav  Choudhary",
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
                                  //       child:
                                  //           Center(child: Text("Your asset"))),
                                  // ),
                                  // Container(
                                  //   height: 50,
                                  //   width: 50,
                                  //   child: Card(
                                  //       color: Colors.grey,
                                  //       child:
                                  //           Center(child: Text("Your asset"))),
                                  // ),
                                  // Container(
                                  //   height: 50,
                                  //   width: 50,
                                  //   child: Card(
                                  //       color: Colors.grey,
                                  //       child:
                                  //           Center(child: Text("Your asset"))),
                                  // ),
                                  //delete the just above code [ all three containers ] and uncomment the below code and set your assets
                                  _cardIcon(Icons.chat, chartbackColor,
                                      chaticoncolor),
                                  _cardIcon(Icons.local_phone, callbgkColor,
                                      calliconcolor),
                                  _cardIcon(Icons.video_call, videobgkColor,
                                      videoiconcolor),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width * .45,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Call us", style: kTitleStyle3),
                                  Text(
                                    "1234567890,\n" + "1234567890",
                                    style: kTitleStyle4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width * .45,
                        child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Mail us", style: kTitleStyle3),
                                    Text(
                                      "xyz@gmail.com",
                                      style: kTitleStyle4,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .45,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Send your message",
                                  style: kTitleStyle3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 35,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Subject',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: TextField(
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'your Message',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
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
