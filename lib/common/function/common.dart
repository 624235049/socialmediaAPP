import 'package:flutter/material.dart';
import 'package:mfecinternship/utils/theme.dart';

void snackBarNetwork({String? msg, GlobalKey<ScaffoldState>? scaffoldState}) {
  scaffoldState!.currentState!.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("$msg"), const Icon(Icons.warning_amber)],
      ),
    ),
  );
}

Widget loadingIndicatorProgressBar({String? data}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          backgroundColor: AppTheme.buttonBackgroundColor,
        ),
        const SizedBox(
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