
import 'package:flutter/material.dart';
import 'package:mfecinternship/feature/home/presentation/widget/widget_small_text.dart';
import 'package:mfecinternship/utils/theme.dart';

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
  double textHeight = 16.0;

  @override
  void initState() {
    // TODO: implement initState
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
          color: AppTheme.paraColor,
          size: 16.0,
          text: firstHalf)
          : Column(
        children: [
          SmallText(
              height: 1.8,
              size: 16.0,
              color: AppTheme.paraColor,
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
              children: [
                SmallText(
                  text: "ดูเพิ่มเติม",
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