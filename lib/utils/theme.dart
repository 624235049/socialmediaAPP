import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppTheme {
  const AppTheme();


  static const Color buttonBackgroundColor = Color(0xFF005B9E);
  static final Color paraColor = const Color(0xFF8f837f);

  static TextStyle h1Style =
  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppTheme.buttonBackgroundColor);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
  static TextStyle titleStyle =  TextStyle(color: Colors.black,fontFamily: 'Roboto',fontSize: 20.0,fontWeight: FontWeight.w500);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
  const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }


  Widget loadingIndicatorProgressBar({String? data}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.orange,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            data==null?"Setting up your account please wait..":data,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}


void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}