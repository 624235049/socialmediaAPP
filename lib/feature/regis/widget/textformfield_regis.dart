
import 'package:flutter/material.dart';
import 'package:mfecinternship/utils/theme.dart';

class TextFormFieldRegis extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;

  TextFormFieldRegis({
    required this.labelText,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 30, right: 30),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(labelText),
          floatingLabelBehavior: FloatingLabelBehavior.always, // set always to show label
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.buttonBackgroundColor,
              width: 1,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}