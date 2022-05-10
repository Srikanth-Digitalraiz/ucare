import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReadData {
  Future<String> getUid() async {
    return FirebaseAuth.instance.currentUser.uid;
  }

  Future<Map> fetchOpeningClosingTime(docId) async {
    Map fetchOpeningClosingTime;
    await FirebaseFirestore.instance
        .collection("clinics")
        .doc(docId)
        .get()
        .then((snapshot) => {
              print(snapshot.data()),
              fetchOpeningClosingTime = {
                "openingTime": snapshot.data()["openingTime"],
                "closingTime": snapshot.data()["closingTime"],
              }
            })
        .catchError((e) => {print(e)});
    return fetchOpeningClosingTime;
  }

  Future<Map> fetchBookedTime(docId) async {
    Map bookedTimeslots;
    await FirebaseFirestore.instance
        .collection("clinics")
        .doc(docId)
        .get()
        .then((snapshot) =>
            {bookedTimeslots = snapshot.data()["bookedTimeSlots"]})
        .catchError((e) => {print(e)});

    return bookedTimeslots;
  }

  Future<List> fetchAppointmentDetails() async {
    List appointmentDetails = new List();
    final uid = await ReadData().getUid();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection("appointments")
        .orderBy("pTimeStamp", descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                appointmentDetails.add({
                  "firstName": doc["pFirstName"],
                  "lastName": doc["pLastName"],
                  "appointmentTime": doc["appointmentTime"],
                  "appointmentStatus": doc["appointmentStatus"],
                  "serviceName": doc["serviceName"]
                });
                print("times");
              })
            });
    return appointmentDetails;
  }
}
