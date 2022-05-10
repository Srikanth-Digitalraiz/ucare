// import 'package:Myclinic/SetData/globlvariables.dart';
// import 'package:Myclinic/SetData/screenarg.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:ucare/SetData/globlvariables.dart';
import 'package:ucare/SetData/screenarg.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/style.dart';

class ServicesPage extends StatefulWidget {
  ServicesPage({Key key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int number;
  String _isBtnDisable = "false";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBars()
            .bottomNavigationBarWithState(
                context, "Book an appointment", _isBtnDisable, () {
          GlobalVariables.selctedServiceTime = 20;

          Navigator.pushNamed(
            context,
            '/ChooseTimeSlotPage',
            arguments: ServiceScrArg("ServiceA", 20),
          ); //PushNamed pushes the new screen route and sends them some arguments
        }),
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            AppBar(
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              title: Text(
                "Services",
                style: kTitleStyle2,
              ),
              centerTitle: true,
              backgroundColor: appBarColor,
              actions: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        }))
              ],
            ),
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20, right: 20),
                        child: table(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget table() {
    return Table(
      children: [
        TableRow(children: [
          cardImg(
              'assets/images/s1.png', 'Teeth Cleaning', "INR 1000 Onward", 1),
          cardImg(
              'assets/images/s1.png', 'Loose Filling', "INR 8000 Onward", 2),
          // cardImg("assets/images/s3.png", 'Loose Filling',"INR 1000 Onward", 3)
        ]),
        TableRow(children: [
          cardImg('assets/images/s1.png', 'Extraction', "INR 5000 Onward", 4),
          cardImg(
              "assets/images/s1.png", "Teeth Extraction", "INR 3500 Onward", 5),
          // cardImg("assets/images/cons.jpg", "Counsltation","INR 1000 Onward", 6)
        ]),
        TableRow(children: [
          cardImg('assets/images/s1.png', 'Root Canal', "INR 4500 Onward", 7),
          cardImg(
              'assets/images/s1.png', 'Clored Crown', "INR 3500 00 Onward", 8),
          // cardImg("assets/images/other.jpg", "Other", "INR 1000 Onward",9)
        ]),
        TableRow(children: [
          cardImg(
              'assets/images/s1.png', 'Metal Less Crown', "INR 8000 Onward", 1),
          cardImg(
              'assets/images/s1.png', 'Loose Filling', "INR 1000 Onward", 2),
          // cardImg("assets/images/s3.png", 'Loose Filling',"INR 1000 Onward", 3)
        ]),
        TableRow(children: [
          cardImg('assets/images/s1.png', 'Straighteing', "INR 1000 Onward", 4),
          cardImg("assets/images/s1.png", "Toothcare", "INR 1000 Onward", 5),
          // cardImg("assets/images/cons.jpg", "Counsltation","INR 1000 Onward", 6)
        ]),
        TableRow(children: [
          cardImg('assets/images/s1.png', 'Emax Veneer', "INR 1000 Onward", 7),
          cardImg('assets/images/s1.png', 'Braces', "INR 50000 Onward", 8),
          // cardImg("assets/images/other.jpg", "Other", "INR 1000 Onward",9)
        ]),
      ],
    );
  }

  Widget cardImg(String path, String title, String subtitle, num num) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: 210,
          width: MediaQuery.of(context).size.width * .5,
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 41,
                        backgroundColor: setbtnColor,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: ClipOval(
                              child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            // child: Container(
                            //     color: Colors.grey,
                            //     child: Center(child: Text("Your asset"))),
                            //delete the just above code [ child container ] and uncomment the below code and set your assets
                            child: Image.asset(
                              path,
                              fit: BoxFit.cover,
                              height: double.maxFinite,
                              width: double.maxFinite,
                            ),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          title,
                          style: kTitleStyle11,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: kTitleStyle12,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 30,
                    child: RaisedButton(
                      onPressed: () {},
                      color: appBarColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "More",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
