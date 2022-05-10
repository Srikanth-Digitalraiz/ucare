// import 'package:Myclinic/SetData/screenarg.dart';
// import 'package:Myclinic/Widgets/datepicker.dart';
// import 'package:Myclinic/utilites/appbar.dart';
// import 'package:Myclinic/utilites/bottomnavigationbar.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/inputfields.dart';
import 'package:flutter/material.dart';
import 'package:ucare/SetData/screenarg.dart';
import 'package:ucare/Widgets/datepicker.dart';
import 'package:ucare/utilites/appbar.dart';
import 'package:ucare/utilites/bottomnavigationbar.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/inputfields.dart';

class RegisterPatient extends StatefulWidget {
  RegisterPatient({Key key}) : super(key: key);

  @override
  _RegisterPatientState createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  var _isBtnDisable = "false";


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneNumberController.clear();
    _emailController.clear();
    _dobController.clear();
    _cityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final ChooseTimeScrArg _chooseTimeScrArgs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBars()
            .bottomNavigationBarWithState(context, "Next", _isBtnDisable, () {
          if (_formKey.currentState.validate()) {
            Navigator.pushNamed(
              context,
              '/ConfirmationPage',
              arguments: PatientDetailsArg(
                  _firstNameController.text,
                  _lastNameController.text,
                  _phoneNumberController.text,
                  _emailController.text,
                  _dobController.text,
                  _cityController.text,
                  _chooseTimeScrArgs.serviceName,
                  _chooseTimeScrArgs.serviceTimeMIn,
                  _chooseTimeScrArgs.selectedTime,
                  _chooseTimeScrArgs.selectedDate),
            );
          }
        }),
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            AppBars().commonAppBar(context, "Register Patient"),
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
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InputFields().textInputFormField(
                            context,
                            "First Name*",
                            TextInputType.text,
                            _firstNameController,
                            (item) {
                              return item.length > 0
                                  ? null
                                  : "Enter your first name";
                            },
                          ),
                          InputFields().textInputFormField(
                            context,
                            "Last Name*",
                            TextInputType.text,
                            _lastNameController,
                            (item) {
                              return item.length > 0 ? null : "Enter last name";
                            },
                          ),
                          InputFields().textInputFormField(
                            context,
                            "Phone Number*",
                            TextInputType.number,
                            _phoneNumberController,
                            (item) {
                              return item.length == 10
                                  ? null
                                  : "Enter a valid Phone number (10 digit)";
                            },
                          ),
                          InputFields().textInputFormField(
                            context,
                            "Email",
                            TextInputType.emailAddress,
                            _emailController,
                            (item) {
                              if (item.isEmpty)
                                return null;
                              else {
                                return item.contains('@')
                                    ? null
                                    : "Enter correct email";
                              }
                            },
                          ),
                          InputFields().dobInputFormField(
                            context,
                            "DOB (MM/DD/YY)*",
                            TextInputType.text,
                            _dobController,
                            true,
                            () async {
                              _dobController.text =
                                  await DatePicker.datePicker(context);
                            },
                            (item) {
                              return item.length > 0 ? null : "Enter DOB";
                            },
                          ),
                          InputFields().textInputFormField(
                            context,
                            "City*",
                            TextInputType.text,
                            _cityController,
                            (item) {
                              return item.length > 0 ? null : "Enter city";
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
