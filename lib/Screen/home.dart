// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _uPhn = "";
  @override
  void initState() {
    // TODO: implement initState
    _setUPhn();

    super.initState();
  }

  _setUPhn() async {
    setState(() {
      _uPhn = FirebaseAuth.instance.currentUser.phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBars().bottomNavigationBar(
          context, "Book an appointment", '/AppoinmentPage'),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AppBars().homePageAppBar("You Care", _uPhn, context),
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
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          // child: Container(
                          //     color: Colors.grey,
                          //     child:
                          //     Center(child: Text("Your assets")),
                          //     //delete the just above code [child container ] and uncomment the below code and set your assets
                          //     // child: Image.asset('assets/images/clinic.png',
                          //     //     fit: BoxFit.fill)

                          // ),
                          child: Image.network('https://images.pexels.com/photos/6129041/pexels-photo-6129041.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', fit: BoxFit.cover, filterQuality: FilterQuality.high,),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, top: 8.0),
                      child: Container(
                        child: _table(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .45,
                            child: _image('assets/images/offr2.jpg'),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .2,
                              width: MediaQuery.of(context).size.width * .45,
                              child: _image('assets/images/offer3.jpg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20, top: 8.0, bottom: 20.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width,
                          child: _image('assets/images/offer1.jpg')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _table() {
    return Table(
      children: [
        TableRow(children: [
          _cardImg('assets/icon/doctor.png', 'About us', "/AboutusPage"),
          _cardImg('assets/icon/teeth.png', 'Services', "/ServicesPage"),
          _cardImg(
              "assets/icon/appoin.png", "Appointment", '/Appointmentstatus')
        ]),
        TableRow(children: [
          _cardImg('assets/icon/docblog.png', 'Doc Blog', "null"),
          _cardImg(
              "assets/icon/comment.png", "Testimonials", "/TestimonialsPage"),
          _cardImg("assets/icon/gallery.png", "Gallery", "/GalleryPage")
        ]),
        TableRow(children: [
          _cardImg('assets/icon/sch.png', 'Availability', '/AvaliblityPage'),
          _cardImg('assets/icon/reachus.png', 'Reach Us', "/ReachUsPage"),
          _cardImg("assets/icon/call.png", "Contact Us", "/ContactUsPage")
        ]),
      ],
    );
  }

  Widget _cardImg(String path, String title, String routeName) {
    return GestureDetector(
      onTap: () {
        print(ModalRoute.of(context).settings.name);
        if (routeName != null) Navigator.pushNamed(context, routeName);
        print("tapped");
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        //width: MediaQuery.of(context).size.width * .1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Container(
              //     height: 50,
              //     width: 50,
              //     color: Colors.grey,
              //     child: Center(child: Text("Your assets"))),
              //         //delete the just above code [child container ] and uncomment the below code and set your assets
              //      ),
              Image.asset(
                path,
                height: 40,
                width: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  style: kTitleStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(String path) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        // child: Container(
        //     color: Colors.grey, child: Center(child: Text("Your assets"))),

        //delete the just above code [child container ] and uncomment the below code and set your assets
       child: Image.asset(path, fit: BoxFit.fill),
      ),
    );
  }
}
