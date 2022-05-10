import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateData {
  Future<String> updateTimeSlot(
      serviceTimeMin, timeSlots, date, appointmentId) async {
    Map bookedTimeSlots = {};
    String res = "";
    final ref = FirebaseFirestore.instance
        .collection('clinics')
        .doc("bR21HR9bkK7cUAZ4JB0Z");
    await ref.get().then((snapshot) async {
      if (snapshot.data()["bookedTimeSlots"][date] == null) {
        bookedTimeSlots = snapshot.data()["bookedTimeSlots"];
        bookedTimeSlots[date] = [
          {
            "bookedTime": timeSlots,
            "forMin": serviceTimeMin,
            "appointmentId": appointmentId
          }
        ];
        await ref.update({"bookedTimeSlots": bookedTimeSlots}).catchError((e) {
          print(e);
          res = "error";
        });
      } else {
        bookedTimeSlots = snapshot.data()["bookedTimeSlots"];
        bookedTimeSlots[date].add({
          "bookedTime": timeSlots,
          "forMin": serviceTimeMin,
          "appointmentId": appointmentId
        });

        await ref.update({"bookedTimeSlots": bookedTimeSlots}).catchError((e) {
          print(e);
          res = "error";
        });
      }
    }).catchError((e) => {print(e), res = "error"});
    return res;
  }
}
