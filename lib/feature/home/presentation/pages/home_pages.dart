import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/common/function/time_converting.dart';
import 'package:mfecinternship/utils/theme.dart';

import '../../../../common/config/app_route.dart';
import '../../../../model/data_model.dart';
import '../widget/widget_menu_drawer.dart';
import 'comment_detail_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final String logoApp = "asset/images/home/logo_appbar.png";
  final List<Data> dataList = [
    Data(
        imageUrl:
            'https://png.pngtree.com/png-clipart/20210314/original/pngtree-cute-cartoon-characters-png-image_6103978.jpg',
        name: 'John'),
    Data(
        imageUrl:
            'https://png.pngtree.com/png-clipart/20210308/original/pngtree-cute-cartoon-girl-material-png-image_5752581.jpg',
        name: 'Jane'),
    Data(
        imageUrl:
            'https://png.pngtree.com/png-clipart/20190116/ourlarge/pngtree-simple-cute-hand-drawn-watercolor-hand-drawn-animal-png-image_387674.jpg',
        name: 'Bob'),
    Data(
        imageUrl:
            'https://s3.theasianparent.com/cdn-cgi/image/width=700,quality=95/tap-assets-prod/wp-content/uploads/sites/25/2018/08/c2.jpg',
        name: 'Alice'),
    Data(
        imageUrl:
            'https://storage.googleapis.com/fastwork-static/d98bd87a-8066-483a-b695-e443fdec51d3.jpg',
        name: 'Mike'),
  ];

  final List<Post> _posts = [
    Post(
        name: "แคชชี่",
        time: "2022-07-07 00:00:00.000", //2565 07 07 - 2022 07 07
        post:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        image:
            'https://quizizz.com/media/resource/gs/quizizz-media/quizzes/f76e8618-4e2f-45a2-a6fa-b42104a31409'),
    Post(
        name: "แคชชี่",
        time: "2022-07-10 00:00:00.000", //2565 07 10 - 2022 07 10
        post:
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..",
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRKsbw1znNtMpTRem56z54Hkl1A7qOrsKGYmH77cugSuW-ug9cMP-_VfrdPOaeFE4WFJA&usqp=CAU'),
    Post(
        name: "แคชชี่",
        time: "2022-07-12 00:00:00.000", //2565 07 10 - 2022 07 12
        post:
            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        image: 'https://i.ytimg.com/vi/Q-qAQzexStc/maxresdefault.jpg'),
  ];
  final List<bool> _liked = [false, false, false];
  final List<TextEditingController> _commentControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final int _countedComment = 3;
  final int _countedLike = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(logoApp),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: drawerHome(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageBuilder.texts!['home_page']['friend_title'],
                  style: AppTheme.h5Style,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.fullfriendlist);
                  },
                  child: Text(LanguageBuilder.texts!['home_page']['friend_all'],
                      style: AppTheme.h5Style),
                ),
              ],
            ),
          ),
          //list friends Story
          listFriendsContent(),
          //list post and comment
          listPostContent(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.createPost);
          },
          child: const Icon(Icons.add, size: 30.0),
          backgroundColor: AppTheme.buttonBackgroundColor,
        ),
      ),
    );
  }

  Widget listPostContent() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.all(0), //set 0 margin between post
            color: Colors.white,
            child: Column(
              children: [
                const Divider(
                  color: AppTheme.dividerPost,
                  thickness: 1,
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppTheme.buttonBackgroundColor,
                                  width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: const EdgeInsets.only(right: 8.0),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                  "asset/images/login/avatar_img.png"),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _posts[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                TimeConverting.getDate(
                                    _posts[index].time, false),
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(_posts[index].post),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: _liked[index]
                                        ? AppTheme.buttonBackgroundColor
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _liked[index] = !_liked[index];
                                    });
                                  }),
                              Text((_countedLike == 0)
                                  ? 'None'
                                  : (_countedLike.toString() +
                                          ' ' +
                                          LanguageBuilder.texts!['post_page']
                                              ['like']) +
                                      ((_countedLike > 1)
                                          ? LanguageBuilder.texts!['time_stamp']
                                              ['suffix']
                                          : '')),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, AppRoute.commentDetail);
                            },
                            child: Row(
                              children: [
                                IconButton(
                                    icon:
                                        const Icon(Icons.mode_comment_outlined),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CommentDetail(
                                              post: _posts[index]),
                                        ),
                                      );
                                    }),
                                Text(((_countedComment == 0)
                                        ? LanguageBuilder.texts!['post_page']
                                            ['no_comment']
                                        : (_countedComment.toString() + ' ')) +
                                    LanguageBuilder.texts!['post_page']
                                        ['comment'] +
                                    ((_countedComment > 1)
                                        ? LanguageBuilder.texts!['time_stamp']
                                            ['suffix']
                                        : '')),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                    thickness: 1, color: AppTheme.dividerPost, height: 0),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget listFriendsContent() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 79,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(dataList[index].imageUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(dataList[index].name),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget drawerHome(BuildContext context) {
    return Drawer(
      child: Column(
        // Important: Remove any padding from the ListView.
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'สุบรรณ นกสังข์ (โบ๊ท)',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text(
              'Mobile Developer',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    const AssetImage('asset/images/login/avatar_img.png'),
                radius: 50,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue, // สีขอบ
                      width: 2.0, // ความกว้างของขอบ
                    ),
                  ),
                )),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.dividerPost,

                  offset: Offset(0, 2)
                )
              ]
            ),
          ),
          ...MenuViewModel()
              .items
              .map((e) => ListTile(
                    leading: Icon(
                      e.icon,
                      color: e.iconColor,
                    ),
                    title: Text(
                      e.title,
                      style: AppTheme.h5Style,
                    ),
                    onTap: () {
                      e.onTap(context);
                      // Update the state of the app.
                      // ...
                    },
                  ))
              .toList(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: AppTheme.buttonBackgroundColor,
            ),
            title: Text(
              LanguageBuilder.texts!['home_drawer']['signout'],
              style: AppTheme.h5Style,
            ),
            onTap: () async {
              Navigator.pushNamed(context, AppRoute.loginRoute);
            },
          ),
        ],
      ),
    );
  }

  Widget friendContents() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(dataList[index].imageUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(dataList[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}
