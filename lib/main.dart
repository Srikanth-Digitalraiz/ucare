// import 'package:Myclinic/Screen/appointment/gallery.dart';
// import 'package:Myclinic/Screen/services.dart';
// import 'package:Myclinic/Screen/aboutus.dart';
// import 'package:Myclinic/Screen/appointment/registerpatient.dart';
// import 'package:Myclinic/Screen/appointment/appointment.dart';
// import 'package:Myclinic/Screen/appointment/appointmentStatus.dart';
// import 'package:Myclinic/Screen/appointment/choosetimeslots.dart';
// import 'package:Myclinic/Screen/appointment/confirmation.dart';
// import 'package:Myclinic/Screen/availiblity.dart';
// import 'package:Myclinic/Screen/conectUs.dart';
// import 'package:Myclinic/Screen/home.dart';
// import 'package:Myclinic/Screen/login.dart';
// import 'package:Myclinic/Screen/reachus.dart';
// import 'package:Myclinic/Screen/testimonials.dart';
// import 'package:Myclinic/Service/AuthService/authservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucare/Screen/aboutus.dart';
import 'package:ucare/Screen/appointment/appointment.dart';
import 'package:ucare/Screen/appointment/appointmentStatus.dart';
import 'package:ucare/Screen/appointment/choosetimeslots.dart';
import 'package:ucare/Screen/appointment/confirmation.dart';
import 'package:ucare/Screen/appointment/gallery.dart';
import 'package:ucare/Screen/appointment/registerpatient.dart';
import 'package:ucare/Screen/availiblity.dart';
import 'package:ucare/Screen/conectUs.dart';
import 'package:ucare/Screen/home.dart';
import 'package:ucare/Screen/login.dart';
import 'package:ucare/Screen/reachus.dart';
import 'package:ucare/Screen/services.dart';
import 'package:ucare/Screen/testimonials.dart';
import 'package:ucare/Service/AuthService/authservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting();
  // if (USE_FIRESTORE_EMULATOR) {
  //   FirebaseFirestore.instance.settings = Settings(
  //       host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  // }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: _defaultHome,
      initialRoute: '/',
      routes: {
        '/': (context) =>

            AuthService().handleAuth(),

        '/LoginPage': (context) => LoginPage(),
        '/HomePage': (context) => HomeScreen(),
        '/AppoinmentPage': (context) => AppointmentPage(),
        '/AboutusPage': (context) => AboutUs(),
        "/ChooseTimeSlotPage": (context) => ChooseTimeSlotPage(),
        '/AvaliblityPage': (context) => AvaliblityPage(),
        '/GalleryPage': (context) => GalleryPage(),
        '/ContactUsPage': (context) => ContactUs(),
        '/Appointmentstatus': (context) => AppointmentStatus(),
        '/ReachUsPage': (context) => ReachUS(),
        '/TestimonialsPage': (context) => Testimonials(),
        '/ServicesPage': (context) => ServicesPage(),
        '/RegisterPatientPage': (context) => RegisterPatient(),
        '/ConfirmationPage': (context) => ConfirmationPage()
      },
    );
  }
}
