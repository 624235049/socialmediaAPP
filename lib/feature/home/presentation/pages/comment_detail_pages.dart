import 'package:flutter/material.dart';
import 'package:mfecinternship/model/data_model.dart';
import 'package:mfecinternship/utils/theme.dart';

class CommentDetail extends StatefulWidget {
  final Post post;

  CommentDetail({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentDetail> createState() => _CommentDetailState();
}

class _CommentDetailState extends State<CommentDetail> {
  Post? post;
  TextEditingController _commentController = TextEditingController();
  String? _replyingTo;

  @override
  void initState() {
    post = widget.post;
    super.initState();
  }

  // final List<Comment> _comments = [
  //   Comment(
  //     id: 1,
  //     avatarImageUrl: 'https://example.com/avatar1.jpg',
  //     name: 'John Doe',
  //     time: '2 hours ago',
  //     comment: 'This is a great post!',
  //   ),
  //   Comment(
  //     id: 2,
  //     avatarImageUrl: 'https://example.com/avatar2.jpg',
  //     name: 'Jane Smith',
  //     time: '1 hour ago',
  //     comment: 'I agree with you!',
  //   ),
  //   Comment(
  //     id: 3,
  //     avatarImageUrl: 'https://example.com/avatar3.jpg',
  //     name: 'Bob Johnson',
  //     time: '5 minutes ago',
  //     comment: 'Thanks for sharing!',
  //   ),
  // ];
  final List<Comment> _comments = [
    Comment(
      id: 1,
      avatarImageUrl: 'https://example.com/avatar1.jpg',
      name: 'John Doe',
      time: '2 hours ago',
      comment: 'This is a great post!',
      replies: [
        Comment(
          id: 4,
          avatarImageUrl: 'https://example.com/avatar4.jpg',
          name: 'Sarah Lee',
          time: '1 hour ago',
          comment: 'I found it really interesting too!',
          replies: [],
        ),
      ],
    ),
    Comment(
      id: 2,
      avatarImageUrl: 'https://example.com/avatar2.jpg',
      name: 'Jane Smith',
      time: '1 hour ago',
      comment: 'I agree with you!',
      replies: [
        Comment(
          id: 5,
          avatarImageUrl: 'https://example.com/avatar5.jpg',
          name: 'Alex Wang',
          time: '30 minutes ago',
          comment: 'I think there are some important points to consider.',
          replies: [],
        ),
        Comment(
          id: 6,
          avatarImageUrl: 'https://example.com/avatar6.jpg',
          name: 'David Kim',
          time: '15 minutes ago',
          comment: 'Can you explain more about your perspective?',
          replies: [],
        ),
      ],
    ),
    Comment(
      id: 3,
      avatarImageUrl: 'https://example.com/avatar3.jpg',
      name: 'Bob Johnson',
      time: '5 minutes ago',
      comment: 'Thanks for sharing!',
      replies: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                      icon: const Icon(
                        Icons.favorite,
                        color: AppTheme.buttonBackgroundColor,
                      ),
                      onPressed: () {
                        // setState(() {
                        //   _favorited = !_favorited;
                        // });
                      },
                    ),
                    const Text(' 2 ถูกใจ'),
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
                    Text(_comments.length.toString() + ' comments'),
                  ],
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(_comments[index].avatarImageUrl),
                      ),
                      title: Text(
                        _comments[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _comments[index].comment,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text(
                                _comments[index].time,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "2 ถูกใจ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _replyingTo = _comments[index].name;
                                  });
                                  _commentController.text =
                                      '@${_comments[index].name} ';
                                },
                                child: const Text(
                                  "ตอบกลับ",
                                  style: TextStyle(color: Colors.indigoAccent),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 72.0),
                      child: Column(
                        children: _comments[index].replies.map((reply) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(reply.avatarImageUrl),
                            ),
                            title: Text(
                              reply.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reply.comment,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      reply.time,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: _replyingTo != null
                  ? Row(
                      children: [
                        Text('ตอบกลับ: @${_replyingTo}'),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _replyingTo = null;
                              _commentController.clear();
                            });
                          },
                          child: const Text('ยกเลิก'),
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage("asset/images/login/avatar_img.png"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'แสดงความคิดเห็น',
                        border: OutlineInputBorder(),
                        suffixIcon: TextButton(
                          onPressed: () {
                            if (_replyingTo != null) {
                              // logic ส่งความคิดเห็นโดยตอบกลับคนนั้น
                            } else {
                              // logic ส่งความคิดเห็นโดยไม่ตอบกลับใคร
                            }
                          },
                          child: const Text('ส่ง'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
