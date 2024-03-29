
import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';

import 'package:socialMediaApp/feature/home/presentation/widget/widget_small_text.dart';
import 'package:socialMediaApp/utils/theme.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = 120.0;

  @override
  void initState() {
    // Implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
          color: Colors.black,
          size: 16.0,
          text: firstHalf)
          : Column(
        children: [
          SmallText(
              height: 1.8,
              size: 16.0,
              color: Colors.black,
              text: hiddenText
                  ? (firstHalf + "...")
                  : (firstHalf + secondHalf)),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmallText(
                  text: LanguageBuilder.texts!['home_page']['post_more'],
                  color: AppTheme.buttonBackgroundColor,
                ),
                Icon(
                  hiddenText
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up,
                  color: AppTheme.buttonBackgroundColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}