import 'package:flutter/material.dart';

import '../../../../model/data_model.dart';
import '../../../../utils/theme.dart';



class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final List<Friend> _allFriendsList = [
    Friend(
        imageUrl:
        'https://png.pngtree.com/png-clipart/20210314/original/pngtree-cute-cartoon-characters-png-image_6103978.jpg',
        name: 'John',position: 'Software Engineer'),
    Friend(
        imageUrl:
        'https://png.pngtree.com/png-clipart/20210308/original/pngtree-cute-cartoon-girl-material-png-image_5752581.jpg',
        name: 'Jane',position: 'Android Developer'),
    Friend(
        imageUrl:
        'https://png.pngtree.com/png-clipart/20190116/ourlarge/pngtree-simple-cute-hand-drawn-watercolor-hand-drawn-animal-png-image_387674.jpg',
        name: 'Bob',position: 'IOS Developer'),
    Friend(
        imageUrl:
        'https://s3.theasianparent.com/cdn-cgi/image/width=700,quality=95/tap-assets-prod/wp-content/uploads/sites/25/2018/08/c2.jpg',
        name: 'Alice',position: 'FrontEnd Developer'),
    Friend(
        imageUrl:
        'https://storage.googleapis.com/fastwork-static/d98bd87a-8066-483a-b695-e443fdec51d3.jpg',
        name: 'Mike',position: 'BackEnd Developer'),
  ];

  List<Friend> _searchResults = [];

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _searchResults = _allFriendsList;
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _searchResults = _allFriendsList.where((friend) {
        final name = friend.name.toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'ค้นหาเพื่อนร่วมงาน',
                prefixIcon: Icon(Icons.search),
              ),
              controller: _searchController,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final friend = _searchResults[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(friend.imageUrl),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          friend.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                         Text(
                          friend.position,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}