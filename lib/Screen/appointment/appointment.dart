// import 'package:Myclinic/SetData/globlvariables.dart';
// import 'package:Myclinic/SetData/screenarg.dart';
// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:ucare/SetData/globlvariables.dart';
import 'package:ucare/SetData/screenarg.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/style.dart';

class AppointmentPage extends StatefulWidget {
  AppointmentPage({Key key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int _number;
  int _serviceTimeMin;
  String _serviceName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBars()
            .bottomNavigationBarWithState(context, "Next", _serviceName, () {
          Navigator.pushNamed(context, "/ChooseTimeSlotPage",
              arguments: ServiceScrArg(_serviceName, _serviceTimeMin));
        }),
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            AppBars()
                .commonAppBar(context, "Book an appointment"), //common app bar
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
                              top: 20.0, left: 20, right: 10),
                          child: Center(
                              child: Text("What type of appointment",
                                  style: kTitleStyle3))),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 10, right: 10),
                        child: _table(), //three row Table
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _table() {
    return Table(
      children: [
        TableRow(children: [
          _cardImg('assets/images/toothCare.png', 'Genral Clean', 1,
              10), //card of each Table
          _cardImg('assets/images/toothCare.png', 'Loose Filling', 2, 20),
          _cardImg("assets/images/toothCare.png", "Crown", 3, 10)
        ]),
        TableRow(children: [
          _cardImg('assets/images/toothCare.png', 'Straighteing', 4, 15),
          _cardImg("assets/images/toothCare.png", "Toothcare", 5, 30),
          _cardImg("assets/images/toothCare.png", "Counsltation", 6, 40)
        ]),
        TableRow(children: [
          _cardImg('assets/images/toothCare.png', 'Root Canal', 7, 90),
          _cardImg('assets/images/toothCare.png', 'Bridge', 8, 5),
          _cardImg("assets/images/toothCare.png", "Other", 9, 180)
        ]),
      ],
    );
  }

  Widget _cardImg(String path, String serviceName, num num, serviceTimeMin) {
    return GestureDetector(
      onTap: () {
        _serviceTimeMin = serviceTimeMin;
        setState(() {
          if (_number == num) {
            setState(() {
              this._serviceName = "";
              _number = 0;
            });
          } else {
            setState(() {
              this._serviceName = serviceName;
              this._serviceTimeMin = serviceTimeMin;
              GlobalVariables.selctedServiceTime = serviceTimeMin;
            });

            _number = num;
          }
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        // width:  MediaQuery.of(context).size.width*.15,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                // child: Container(
                //     height: MediaQuery.of(context).size.height * .15,
                //     color: Colors.grey,
                //     child: Center(child: Text("Your asset"))),
                //delete the just above code [ child container ] and uncomment the below code and set your assets
                child: Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: Image.asset(
                    path,
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: num == _number
                      ? Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: setbtnColor,
                          child: Center(
                              child: Text(
                            serviceName,
                            style: kTitleStyle13,
                          )),
                        )
                      : Text(
                          serviceName,
                          style: kTitleStyle,
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
