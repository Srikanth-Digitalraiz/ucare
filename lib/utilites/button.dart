// import 'package:Myclinic/utilites/color.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/color.dart';

class Buttons {
  Widget commonButton(onPressed,String title) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          //side: BorderSide(color: Colors.red)
        ),
        onPressed: onPressed,
        color: appBarColor,
        textColor: Colors.white,
        child: Text(title, style: TextStyle(fontSize: 14)));
  }
}
