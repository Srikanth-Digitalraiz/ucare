// import 'package:Myclinic/utilites/color.dart';
import 'package:flutter/material.dart';
import 'package:ucare/utilites/color.dart';

class BottomNavigationBars {
  Widget bottomNavigationBar(BuildContext context, String title, String route) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 8.0, bottom: 8.0),
        child: SizedBox(
          height: 35,
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: appBarColor,
              child: Center(
                  child: Text(title,
                      style: TextStyle(
                        color: Colors.white,
                      ))),
              onPressed: () {
                Navigator.pushNamed(context, route);
              }),
        ),
      ),
    );
  }

  Widget bottomNavigationBarWithState(context, btnName, clickable, onPressed) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20, top: 8.0, bottom: 8.0),
          child: SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: appBarColor,
                child: Center(
                    child: Text(btnName,
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                onPressed: clickable == "" ? null : onPressed),
          ),
        ));
  }
}
