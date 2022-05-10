// import 'package:Myclinic/Service/AuthService/authservice.dart';
// import 'package:Myclinic/utilites/color.dart';
// import 'package:Myclinic/utilites/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ucare/Service/AuthService/authservice.dart';
import 'package:ucare/utilites/color.dart';
import 'package:ucare/utilites/style.dart';

class AppBars {
  Widget homePageAppBar(String title, String uPhn, context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          "UCare",
          style: kTitleStyle2,
        ),
      ),
      backgroundColor: appBarColor,
      actions: <Widget>[
        // Center(child: Text(uPhn)),
        Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                onPressed: () {

                 _showMyDialog(context, uPhn);

                }
                //

                ))
      ],
    );
  }

  handleSignOut() async {
    bool isSignOut = await AuthService.signOut();

    if (isSignOut) {
      print("SignOut success $isSignOut");
      Fluttertoast.showToast(
          msg: "Signed Out",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  Widget commonAppBar(context, String title) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text(
        title,
        style: kTitleStyle2,
      ),
      centerTitle: true,
      backgroundColor: appBarColor,
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }))
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context, String uPhn) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //  title: Center(child: Text('Login With')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Mobile No",style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,color:  Color(0xFF004272)),),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Text('$uPhn',style:TextStyle(fontSize: 16 ,color:  Color(0xFF1e1e1e)),),
                ),

                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  //side: BorderSide(color: Colors.red)
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                  handleSignOut();

                },
                color:  Color(0xFF0045689),
                textColor: Colors.white,
                child: Text("Logout", style: TextStyle(fontSize: 14)))

          ],
        );
      },
    );
  }
}
