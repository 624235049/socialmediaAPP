import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/common/function/time_converting.dart';
import 'package:mfecinternship/model/data_model.dart';
import 'package:mfecinternship/utils/theme.dart';

class CommentDetail extends StatefulWidget {
  final Post post;

  const CommentDetail({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentDetail> createState() => _CommentDetailState();
}

class _CommentDetailState extends State<CommentDetail> {
  Post? post;

  @override
  void initState() {
    post = widget.post;
    super.initState();
  }

  final List<Comment> _comments = [
    Comment(
      id: 1,
      avatarImageUrl: 'https://example.com/avatar1.jpg',
      name: 'John Doe',
      time: '1675270414002',
      comment: 'This is a great post!',
    ),
    Comment(
      id: 2,
      avatarImageUrl: 'https://example.com/avatar2.jpg',
      name: 'Jane Smith',
      time: '1677070414002',
      comment: 'I agree with you!',
    ),
    Comment(
      id: 3,
      avatarImageUrl: 'https://example.com/avatar3.jpg',
      name: 'Bob Johnson',
      time: '1677472418973',
      comment: 'Thanks for sharing!',
    ),
    Comment(
      id: 4,
      avatarImageUrl: 'https://example.com/avatar3.jpg',
      name: 'Prayut Chanocha',
      time: DateTime.now().millisecondsSinceEpoch.toString(),
      comment: 'Thanks for sharing!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TimeConverting timeConvert = TimeConverting();
    bool _favorited = true; // for mocking this user liked
    int _likeCount = 2; // mock counting of like
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: AppTheme.buttonBackgroundColor, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(right: 8.0),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage("asset/images/login/avatar_img.png"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post!.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        post!.time,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15.0, left: 15.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  post!.post,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: post!.image != null
                    ? Image.network(post!.image)
                    : Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: (_favorited == true)
                          ? const Icon(
                              Icons.favorite,
                              color: AppTheme.buttonBackgroundColor,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: AppTheme.buttonBackgroundColor,
                            ),
                      onPressed: () {
                        setState(() {
                          _favorited = !_favorited;
                          if (_favorited == true) {
                            _likeCount++;
                          } else {
                            _likeCount--;
                          }
                        });
                      },
                    ),
                    Text(_likeCount.toString() +
                        ' ' +
                        LanguageBuilder.texts!['post_page']['like'] +
                        ((_likeCount > 1)
                            ? (LanguageBuilder.texts!['time_stamp']['suffix'])
                            : '')),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.comment_bank_outlined,
                        color: AppTheme.buttonBackgroundColor,
                      ),
                      onPressed: () {},
                    ),
                    Text(((_comments.isNotEmpty)
                            ? (_comments.length.toString() + ' ')
                            : LanguageBuilder.texts!['post_page']
                                ['no_comment']) +
                        LanguageBuilder.texts!['post_page']['comment'] +
                        ((_comments.length > 1)
                            ? (LanguageBuilder.texts!['time_stamp']['suffix'])
                            : '')),
                  ],
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  "asset/images/login/avatar_img.png"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _comments[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                _comments[index].comment,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                timeConvert.extractTime(_comments[index].time) +
                                  ((timeConvert.timeDifNow(_comments[index].time).inSeconds < 2) ? '': LanguageBuilder.texts!['time_stamp']['ago'])
                                    ,
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(),
                    ],
                  ),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: LanguageBuilder.texts!['post_page']
                      ['comment_field'],
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
