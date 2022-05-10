import 'dart:async';
// import 'package:Myclinic/Service/AuthService/authservice.dart';
// import 'package:Myclinic/Widgets/countrypicker.dart';
// import 'package:Myclinic/utilites/button.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/inputfields.dart';
// import 'package:Myclinic/utilites/loadingindicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ucare/Service/AuthService/authservice.dart';
import 'package:ucare/Widgets/countrypicker.dart';
import 'package:ucare/utilites/button.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/inputfields.dart';
import 'package:ucare/utilites/loadingindicator.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _phoneNo = "";
  String _verificationId = "";
  String _smsCode = "";
  String _selectedCounteryCode = "";

  bool _otpInputFieldError = false;
  bool _codeSent = false;
  bool _isLoginBtnPressed = false;
  bool _isVerifyBtnPressed = false;
  TextEditingController _otpController,
      _countryCodeControlller,
      __phnNumberControlller;
  // ..text = "123456";

  StreamController<ErrorAnimationType> _errorController;

  @override
  void initState() {
    // TODO: implement initState
    _errorController = StreamController<ErrorAnimationType>();
    _otpController = TextEditingController();
    _countryCodeControlller = TextEditingController();
    __phnNumberControlller = TextEditingController();

    super.initState();
  }

  void dispose() {
    // TODO: implement dispose
    _errorController.close();
    _otpController.clear();
    _countryCodeControlller.clear();
    __phnNumberControlller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      //resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
               begin: Alignment.topLeft,
          end: Alignment.bottomRight,
                colors: [appBarColor, Colors.blue])

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("UCare",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: "OpenSans-ExtraBoldItalic")),
            // Image(image: AssetImage("assets/images/clinicLogo.png")),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _codeSent ? Container() : _countryCodeInputField(),
                          _codeSent
                              ? Container()
                              : _selectedCounteryCode == ""
                                  ? Container()
                                  : SizedBox(height: 10),
                          _codeSent
                              ? Container()
                              : _selectedCounteryCode == ""
                                  ? Container()
                                  : _phnInputField(),
                          _codeSent ? Container() : SizedBox(height: 10),
                          _codeSent
                              ?const Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text("Enter OTP"),
                                )
                              : Container(),
                          _codeSent ? _otpInputField() : Container(),
                          _otpInputFieldError
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Plese enter a valid otp",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ))
                              : Container(),
                          _codeSent ? Container() : SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _codeSent
                                  ? _isVerifyBtnPressed
                                      ? Container()
                                      : _resetBtn()
                                  : Container(),
                              _codeSent
                                  ? const SizedBox(
                                      width: 10,
                                    )
                                  : Container(),
                              _codeSent
                                  ? _isVerifyBtnPressed
                                      ? LoadingIndicator().circularIndicator()
                                      : _verifyBtn()
                                  : _isLoginBtnPressed
                                      ? LoadingIndicator().circularIndicator()
                                      : loginBtn(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  _countryCodePicker() async {
    final country = await CountryPciker().countryCodePicker(context);
    if (country != null) {
      print("Selected Country is: ${country.callingCode}");

      setState(() {
        _countryCodeControlller.text = country.callingCode;
        _selectedCounteryCode = country.callingCode;

        // country.callingCode;
      });
    }
  }

  Widget _resetBtn() {
    return Buttons().commonButton(
      () {
        Navigator.of(context).popAndPushNamed('/LoginPage');
      }, "Resend"
    );
  }

  Widget loginBtn() {
    return Buttons().commonButton(
      _selectedCounteryCode == "" || _phoneNo == ""
          ? null
          : () {

              if (_formKey.currentState.validate()) {
                _handleAuth();
                setState(() {
                  _isLoginBtnPressed = true;
                });
              }
            }, "Login"
    );
  }

  Widget _verifyBtn() {
    return Buttons().commonButton(
      () {
        _formKey.currentState.validate();
        if (_smsCode.length != 6) {
          _errorController.add(
              ErrorAnimationType.shake); // Triggering error shake animation

          setState(() {
            _otpInputFieldError = true;
          });
        } else {
          setState(() {
            _otpInputFieldError = false;
          });
          _handleAuth();
          setState(() {
            _isVerifyBtnPressed = true;
          });
        }
      },"Verify"
    );
  }

  Widget _otpInputField() {
    return InputFields().otpInputField(
      context,
      _errorController,
      _otpController,
      (value) {
        print(value);
        setState(() {
          this._smsCode = value;
        });
      },
    );
  }

  Widget _phnInputField() {
    return InputFields().phnInputField(
      context,
      __phnNumberControlller,
      (val) {
        setState(() {
          this._phoneNo = "$val";
        });
      },
    );
  }

  Widget _countryCodeInputField() {
    return InputFields().countryCodeInputField(
      context,
      _countryCodeControlller,
      () {
        _countryCodePicker();
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }

  Future<void> _verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      //AuthService()
      bool verified = await AuthService().signIn(authResult);
      if (verified) {
        Fluttertoast.showToast(
            msg: "Signed In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 14.0);
      }
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
      Fluttertoast.showToast(
          msg: "Smoething wents wrong ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0);
      setState(() {
        _isLoginBtnPressed = false;
      });
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this._verificationId = verId;
      setState(() {
        this._codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this._verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo, //country code with phone number
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed, //error handling function
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  _handleAuth() async {
    if (_codeSent) {
      bool verified =
          await AuthService().signInWithOTP(_smsCode, _verificationId);
      if (verified) {
        Fluttertoast.showToast(
            msg: "Signed In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 14.0);
      } else {
        Fluttertoast.showToast(
            msg: "Please enter a valid otp",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 14.0);
        setState(() {
          _isVerifyBtnPressed = false;
        });
      }
    } else
      _verifyPhone("$_selectedCounteryCode$_phoneNo"); //handle auto fill otp
  }
}
