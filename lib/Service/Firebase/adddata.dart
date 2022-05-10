// import 'package:Myclinic/Service/Firebase/readdata.dart';
// import 'package:Myclinic/Service/Firebase/updatedata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucare/Service/Firebase/readdata.dart';
import 'package:ucare/Service/Firebase/updatedata.dart';

class AddData {
  Future<String> addAppointments(pFirstName, pLastName, pPhn, pEmail, pDOB,
      pCity, serviceName, serviceTimeMin, appointmentTime, date) async {
    final uid = await ReadData().getUid();
    String res = "";
    var sendData = {
      "appointmentDate": date,
      "serviceTimeMin": serviceTimeMin,
      "serviceName": serviceName,
      "appointmentTime": appointmentTime,
      "appointmentStatus": "Confirmed",
      "pPhn": pPhn,
      "pCity": pCity,
      "pDOB": pDOB,
      "pFirstName": pFirstName,
      "pLastName": pLastName,
      "pTimeStamp": FieldValue.serverTimestamp()
    };

    var ref = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection("appointments");

    await ref.add(sendData).then((doc) async {
      await ref
          .doc(doc.id)

          .update({"appointmentId": doc.id}).then((value) async {
        res = await UpdateData().updateTimeSlot(
            serviceTimeMin, appointmentTime, date, doc.id);
      }).catchError((e) {
        print(e);
        res = "error";
      });
    }).catchError((e) {
      print(e);
      res = "error";
    });

    return res;
  }
}
