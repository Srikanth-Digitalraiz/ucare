// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/loadingindicator.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/loadingindicator.dart';
import 'package:ucare/utilites/style.dart';

class AppointmentStatus extends StatefulWidget {
  AppointmentStatus({Key key}) : super(key: key);

  @override
  _AppointmentStatusState createState() => _AppointmentStatusState();
}

class _AppointmentStatusState extends State<AppointmentStatus> {
  String _uid = "";
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    _getUid();

    super.initState();
  }

  _getUid() async {
    setState(() {
      _uid = FirebaseAuth.instance.currentUser.uid;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBars()
          .bottomNavigationBar(context, "Contact Us", '/ContactUsPage'),
      appBar: AppBars().commonAppBar(context, "MyAppointment"), //common appbar
      body: _isLoading
          ? LoadingIndicator().circularIndicator()
          : _appointmentList(),
    );
  }

  Widget _appointmentList() {
    // <1> Use FutureBuilder
    return FutureBuilder<QuerySnapshot>(
        // <2> Pass `Future<QuerySnapshot>` to future
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(_uid)
            .collection("appointments")
            .orderBy("pTimeStamp", descending: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data.docs;

            return documents.length == 0
                ? Center(
                    child: Text(
                    "No Record Found",
                    style: kTitleStyle16,
                  ))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new ListView.builder(
                        shrinkWrap: true,
                        itemCount: documents.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return _card(documents, index);
                        }),
                  );
          } else if (snapshot.hasError) {
            print("error");
            return Text("It's Error!");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _card(appointmentDetails, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _appointmentDate(
              appointmentDetails[index]["appointmentDate"],
            ),
            // VerticalDivider(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Text("Name: ", style: kTitleStyle7),
                        Text(
                            appointmentDetails[index]["pFirstName"] +
                                " " +
                                appointmentDetails[index]["pLastName"],
                            style: kTitleStyle8),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Time: ", style: kTitleStyle7),
                        Text(appointmentDetails[index]["appointmentTime"],
                            style: kTitleStyle8),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child:
                                Container(height: 1, color: Colors.grey[300])),
                        Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: appointmentDetails[index]
                                        ["appointmentStatus"] ==
                                    "Pending"
                                ? _statusIndicator(Colors.yellowAccent)
                                : appointmentDetails[index]
                                            ["appointmentStatus"] ==
                                        "Reschedule"
                                    ? _statusIndicator(Colors.orangeAccent)
                                    : appointmentDetails[index]
                                                ["appointmentStatus"] ==
                                            "Rejected"
                                        ? _statusIndicator(Colors.red)
                                        : appointmentDetails[index]
                                                    ["appointmentStatus"] ==
                                                "Confirmed"
                                            ? _statusIndicator(Colors.green)
                                            : null),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Text(
                            appointmentDetails[index]["appointmentStatus"],
                            style: kTitleStyle7,
                          ),
                        )
                      ],
                    ),
                    Text("Appointment Type", style: kTitleStyle7),
                    Text(appointmentDetails[index]["serviceName"],
                        style: kTitleStyle8)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appointmentDate(date) {
    var appointmentDate = date.split("-");
    var appointmentMonth;
    switch (appointmentDate[0]) {
      case "1":
        appointmentMonth = "JAN";
        break;
      case "2":
        appointmentMonth = "FEB";
        break;
      case "3":
        appointmentMonth = "MARCH";
        break;
      case "4":
        appointmentMonth = "APRIL";
        break;
      case "5":
        appointmentMonth = "MAY";
        break;
      case "6":
        appointmentMonth = "JUN";
        break;
      case "7":
        appointmentMonth = "JULY";
        break;
      case "8":
        appointmentMonth = "AUG";
        break;
      case "9":
        appointmentMonth = "SEP";
        break;
      case "10":
        appointmentMonth = "OCT";
        break;
      case "11":
        appointmentMonth = "NOV";
        break;
      case "12":
        appointmentMonth = "DEC";
        break;
    }

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(appointmentMonth, style: kTitleStyle6),
        Text(appointmentDate[1], style: kTitleStyle9),
        Text(appointmentDate[2], style: kTitleStyle6),
      ],
    );
  }

  Widget _statusIndicator(color) {
    return CircleAvatar(radius: 4, backgroundColor: color);
  }
}
