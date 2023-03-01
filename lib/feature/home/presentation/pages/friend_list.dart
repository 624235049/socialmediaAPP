import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class FullFriendList extends StatefulWidget {
  const FullFriendList({Key? key}) : super(key: key);

  @override
  State<FullFriendList> createState() => _FullFriendListState();
}

class _FullFriendListState extends State<FullFriendList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "เพื่อนร่วมงาน",
          style: AppTheme.titleStyle,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}
