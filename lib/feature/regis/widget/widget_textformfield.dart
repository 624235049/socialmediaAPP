
import 'package:flutter/material.dart';


class TextFormFieldRegis extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String hintText;
  final int? maxLength;
  final String? helperText;

  TextFormFieldRegis({
    required this.textController,
    required this.labelText,
    this.obscureText = false,
    required this.keyboardType,
    this.hintText = '',
    this.maxLength,
    this.helperText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(
      //     left: 30, right: 30),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: textController,
        maxLength: maxLength,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(labelText),
          hintText: hintText,
          helperText: helperText,
          helperMaxLines: 3,
          floatingLabelBehavior: FloatingLabelBehavior.always, // set always to show label
          border: const OutlineInputBorder(),
          // border: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.black,
          //     width: 1.5,
          //   ),
          // ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: AppTheme.buttonBackgroundColor,
          //     width: 1.5,
          //   ),
          // ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: AppTheme.buttonBackgroundColor,
          //     width: 1.5,
          //   ),
          // ),
          // filled: true,
          // fillColor: Colors.transparent,
        ),
      ),
    );
  }
}