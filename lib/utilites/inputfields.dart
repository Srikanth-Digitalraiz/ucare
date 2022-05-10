// import 'package:Myclinic/utilites/color.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ucare/utilites/color.dart';

class InputFields {
  Widget textInputFormField(
      context, lableText, keyboardType, controller, validator) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: lableText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          )),
    );
  }

  Widget dobInputFormField(context, lableText, keyboardType, controller,
      readOnly, onTap, validator) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: lableText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          )),
    );
  }

  Widget otpInputField(context, _errorController, _otpController, onChanged) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        inactiveColor: appBarColor,
        shape: PinCodeFieldShape.box,
        activeColor: Colors.green,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      errorAnimationController: _errorController,
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      //enableActiveFill: true,
      //errorAnimationController: errorController,
      controller: _otpController,
      onCompleted: (v) {
        print("Completed");
      },

      onChanged: onChanged,

      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  Widget phnInputField(context, __phnNumberControlller, onChanged) {
    return TextFormField(
      validator: (item) {
        return item.length == 10 ? null : "Enter a valid 10 digit Phone number";
      },
      controller: __phnNumberControlller,
      keyboardType: TextInputType.number,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: appBarColor,
          ),
          labelText: 'Enter Mobile Number',
          labelStyle: TextStyle(fontSize: 12, color: appBarColor),
          //hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                //  width: 5    ,
                //style: BorderStyle.none,
                color: appBarColor),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(5),
          fillColor: Color(0xFFf3eff5)),
    );
  }

  Widget countryCodeInputField(context, _countryCodeControlller, onTap) {
    return TextField(
      readOnly: true,
      controller: _countryCodeControlller,
      onTap: onTap,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.flag,
            color: appBarColor,
          ),
          labelText: 'Select Country Code',
          labelStyle: TextStyle(fontSize: 12, color: appBarColor),
          //hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                //  width: 5    ,
                //style: BorderStyle.none,
                color: appBarColor),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(5),
          fillColor: Color(0xFFf3eff5)),
    );
  }
}
