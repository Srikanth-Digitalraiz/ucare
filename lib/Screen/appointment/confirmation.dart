// import 'package:Myclinic/Service/Firebase/adddata.dart';
// import 'package:Myclinic/SetData/screenarg.dart';
// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/loadingindicator.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ucare/Service/Firebase/adddata.dart';
import 'package:ucare/SetData/screenarg.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/loadingindicator.dart';
import 'package:ucare/utilites/style.dart';

class ConfirmationPage extends StatefulWidget {
  ConfirmationPage({Key key}) : super(key: key);

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  bool _isLoading = false;
  String _isBtnDisable = "false";

  @override
  Widget build(BuildContext context) {
    final PatientDetailsArg _patientDetailsArgs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBars()
            .bottomNavigationBarWithState(
                context, "Confirm Appointment", _isBtnDisable, () {
          //  Service.myfb(); //if you want to add something in all documents of one collection then you can invoke this method. this is for only the developing part.

          _updateBookedSlot(
              _patientDetailsArgs.pFirstName,
              _patientDetailsArgs.pLastName,
              _patientDetailsArgs.pPhn,
              _patientDetailsArgs.pEmail,
              _patientDetailsArgs.pDOB,
              _patientDetailsArgs.pCity,
              _patientDetailsArgs.serviceName,
              _patientDetailsArgs.serviceTimeMIn,
              _patientDetailsArgs.selectedTime,
              _patientDetailsArgs
                  .selectedDate); // Mehod handls all the booking sysytem operation.
        }),
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            AppBars().commonAppBar(context, "Booking Confirmation"),
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
                              top: 20.0, left: 10, right: 10),
                          child: _isLoading
                              ? Center(
                                  child: LoadingIndicator().circularIndicator())
                              : Center(
                                  child: Container(
                                      height: 250,
                                      width: double.infinity,
                                      child: _cardView(_patientDetailsArgs)),
                                )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));

    //    Container(
    //       color: bgColor,
    //       child: _isLoading
    //           ? Center(child: CircularProgressIndicator())
    //           : Center(
    //               child: Container(
    //                   height: 250,
    //                   width: double.infinity,
    //                   child: _cardView(patientDetailsArgs)),
    //             )),
    // );
  }

  Widget _cardView(args) {
    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: setbtnColor,
              ),
              child: Center(
                child: Text(
                  "Please Confirm All Details",
                  style: TextStyle(
                    fontFamily: 'OpenSans-SemiBold',
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Divider(),
            Text(
              "Patient Name - ${args.pFirstName} " + "${args.pLastName}",
              style: kTitleStyle15,
            ),
            SizedBox(height: 10),
            Text("Service Name - ${args.serviceName}", style: kTitleStyle15),
            SizedBox(height: 10),
            Text("Service Time - ${args.serviceTimeMIn} Minute",
                style: kTitleStyle15),
            SizedBox(height: 10),
            Text("Date - ${args.selectedDate}", style: kTitleStyle15),
            SizedBox(height: 10),
            Text("Time - ${args.selectedTime}", style: kTitleStyle15),
            SizedBox(height: 10),
            Text("Mobile Number - ${args.pPhn}", style: kTitleStyle15)
          ],
        ),
      ),
    );
  }

  void _updateBookedSlot(pFirstName, pLastName, pPhn, pEmail, pDOB, pCity,
      serviceName, serviceTimeMin, setTime, selectedDate) async {
    setState(() {
      _isLoading = true;
      _isBtnDisable = "";
    });

    var res = await AddData().addAppointments(
      pFirstName,
      pLastName,
      pPhn,
      pEmail,
      pDOB,
      pCity,
      serviceName,
      serviceTimeMin,
      setTime,
      selectedDate,
    ); //The method performs a database operation, which is defined in the service folder

    if (res == "") {
      Fluttertoast.showToast(
          msg: "Successfully Booked",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0);
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/Appointmentstatus', ModalRoute.withName('/'));
    }
    if (res == "error") {
      Fluttertoast.showToast(
          msg: "Something Went Wrong. Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0);
      Navigator.pop(context);
    }

    setState(() {
      _isLoading = false;
      _isBtnDisable = "false";
    });
  }
}
