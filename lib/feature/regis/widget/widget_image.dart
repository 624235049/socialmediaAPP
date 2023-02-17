import 'package:flutter/material.dart';

class WidgetImage extends StatelessWidget {
  const WidgetImage({
    Key? key,
    this.size,
    this.path,
    this.boxFit,
  }) : super(key: key);

  final double? size;
  final String? path;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path ?? 'images/logo.png',
      width: size,
      height: size,fit: boxFit,
    );
  }
}