import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_builder/language_builder.dart';
import 'package:socialMediaApp/feature/auth/domain/entities/user_entity.dart';
import 'package:socialMediaApp/feature/home/cubit/post/post_cubit.dart';
import 'package:socialMediaApp/feature/home/cubit/user/user_cubit.dart';
import 'package:socialMediaApp/utils/theme.dart';

import '../../../../common/config/app_route.dart';
import '../../../../model/data_model.dart';
import '../widget/widget_exandable.dart';
import '../widget/widget_menu_drawer.dart';

class HomePage extends StatefulWidget {
  final String uid;

  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final GlobalKey<_HomePageState> _key = GlobalKey<_HomePageState>();
  final String logoApp = "asset/images/home/logo_appbar.png";
  File? _image;

  @override
  void initState() {
    print("uid ==> ${widget.uid}");
    BlocProvider.of<UserCubit>(context).getUsers();
    BlocProvider.of<PostCubit>(context).getPosts();
    super.initState();
  }

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
            "Duis auteiruredolorin reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        image: 'https://i.ytimg.com/vi/Q-qAQzexStc/maxresdefault.jpg'),
    Post(
        name: "แคชชี่",
        time: "2022-07-12 00:00:00.000", //2565 07 10 - 2022 07 12
        post:
            "Duis auteiruredolorin reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        image: 'https://i.ytimg.com/vi/Q-qAQzexStc/maxresdefault.jpg'),
  ];
  final List<bool> _liked = [false, false, false];
  final List<TextEditingController> _commentControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final int _countedComment = 5;
  final int _countedLike = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Image.asset(logoApp),
        ),
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
                    Navigator.pushNamed(context, AppRoute.friendlist);
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
          BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is PostSuccess) {
                return listPostContent();
              }
              return listPostContent();
            },
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.createPost,
                arguments: widget.uid);
          },
          child: const Icon(Icons.add, size: 30.0),
          backgroundColor: AppTheme.buttonBackgroundColor,
        ),
      ),
    );
  }

  // Widget listPostContent() {
  //   return BlocBuilder<PostCubit, PostState>(
  //     builder: (context, postState) {
  //       if (postState is PostLoaded) {
  //         return Expanded(
  //           child: SizedBox(
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height,
  //             child: ListView.builder(
  //               shrinkWrap: true,
  //               physics: const ScrollPhysics(),
  //               itemCount: postState.posts.length,
  //               itemBuilder: (BuildContext context, int index) {
  //                 final post = postState.posts[index];
  //
  //                 return Card(
  //                   color: Colors.white,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         BlocBuilder<UserCubit, UserState>(
  //                           builder: (context, userState) {
  //                             if (userState is UserLoaded && userState.users.length > index) {
  //                               final user = userState.users[index];
  //
  //                               return Row(
  //                                 children: [
  //                                   Container(
  //                                     decoration: BoxDecoration(
  //                                       color: Colors.white,
  //                                       border: Border.all(
  //                                           color: AppTheme.buttonBackgroundColor,
  //                                           width: 2),
  //                                       borderRadius: BorderRadius.circular(20),
  //                                     ),
  //                                     margin: const EdgeInsets.only(right: 8.0),
  //                                     child: CircleAvatar(
  //                                       radius: 20,
  //                                       backgroundColor: Colors.white,
  //                                       backgroundImage: user.imageUrl != null ? NetworkImage(user.imageUrl.toString()) : null,
  //                                     ),
  //                                   ),
  //                                   Row(
  //                                     crossAxisAlignment:
  //                                     CrossAxisAlignment.start,
  //                                     children: [
  //                                       Text(
  //                                         user.fullName.toString(),
  //                                         style: const TextStyle(
  //                                             fontWeight: FontWeight.bold,
  //                                             fontSize: 16),
  //                                       ),
  //                                       const SizedBox(
  //                                         width: 10,
  //                                       ),
  //                                       Text(
  //                                         user.datetime.toString(),
  //                                         style: const TextStyle(
  //                                             color: Colors.grey),
  //                                       )
  //                                     ],
  //                                   )
  //                                 ],
  //                               );
  //                             } else {
  //                               return Container(); // or any other fallback widget if the userState is not UserLoaded or the user at the specified index is not found
  //                             }
  //                           },
  //                         ),
  //                         SingleChildScrollView(
  //                           child: ExpandableTextWidget(
  //                               text: postState.posts[index].postContent
  //                                   .toString()),
  //                         ),
  //                         const SizedBox(
  //                           height: 10,
  //                         ),
  //                         SizedBox(
  //                           height: 200,
  //                           width: MediaQuery.of(context).size.width,
  //                           child: GridView.count(
  //                             crossAxisCount: 3,
  //                             childAspectRatio: 1.0,
  //                             mainAxisSpacing: 2.0,
  //                             crossAxisSpacing: 2.0,
  //                             padding: const EdgeInsets.all(2.0),
  //                             // Corrected line for the decoration property
  //                             clipBehavior: Clip.none,
  //                             children: List.generate(
  //                               postState.posts[index].postImages!.length,
  //                                   (i) {
  //                                 return Container(
  //                                   margin: const EdgeInsets.all(2.0),
  //                                   decoration: BoxDecoration(
  //                                     border: Border.all(
  //                                         color: Colors.grey[700]!, width: 1),
  //                                     borderRadius: BorderRadius.circular(10),
  //                                   ),
  //                                   child: Container(
  //                                     decoration: BoxDecoration(
  //                                       image: DecorationImage(
  //                                         image: NetworkImage(postState
  //                                             .posts[index].postImages![i]),
  //                                         fit: BoxFit.cover,
  //                                       ),
  //                                     ),
  //                                     child: i == 2 &&
  //                                         postState.posts[index].postImages!
  //                                             .length >
  //                                             3
  //                                         ? Center(
  //                                       child: Container(
  //                                         color: Colors.black
  //                                             .withOpacity(0.5),
  //                                         child: Text(
  //                                           '+${postState.posts[index].postImages!.length - 3}',
  //                                           style: TextStyle(
  //                                               color: Colors.white),
  //                                         ),
  //                                       ),
  //                                     )
  //                                         : null,
  //                                   ),
  //                                 );
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 IconButton(
  //                                     icon: const Icon(
  //                                       Icons.favorite_border,
  //                                       color: AppTheme.buttonBackgroundColor,
  //                                       // _liked[index]
  //                                       //     ? Icons.favorite
  //                                       //     : Icons.favorite_border,
  //                                       // color: _liked[index]
  //                                       //     ? AppTheme.buttonBackgroundColor
  //                                       //     : AppTheme.buttonBackgroundColor,
  //                                     ),
  //                                     onPressed: () {
  //                                       setState(() {
  //                                         // _liked[index] = !_liked[index];
  //                                       });
  //                                     }),
  //                                 Text((_countedLike == 0)
  //                                     ? 'None'
  //                                     : (_countedLike.toString() +
  //                                     ' ' +
  //                                     LanguageBuilder
  //                                         .texts!['post_page']
  //                                     ['like']) +
  //                                     ((_countedLike > 1)
  //                                         ? LanguageBuilder
  //                                         .texts!['time_stamp']
  //                                     ['suffix']
  //                                         : '')),
  //                               ],
  //                             ),
  //                             GestureDetector(
  //                               onTap: () {
  //                                 // Navigator.pushNamed(context, AppRoute.commentDetail);
  //                               },
  //                               child: Row(
  //                                 children: [
  //                                   IconButton(
  //                                       icon: const Icon(
  //                                           Icons.mode_comment_outlined),
  //                                       onPressed: () {
  //                                         // Navigator.push(
  //                                         //   context,
  //                                         //   MaterialPageRoute(
  //                                         //     builder: (context) =>
  //                                         //         CommentDetail(
  //                                         //             post: _posts[index]),
  //                                         //   ),
  //                                         // );
  //                                       }),
  //                                   Text(((_countedComment == 0)
  //                                       ? LanguageBuilder
  //                                       .texts!['post_page']
  //                                   ['no_comment']
  //                                       : (_countedComment.toString() +
  //                                       ' ')) +
  //                                       LanguageBuilder.texts!['post_page']
  //                                       ['comment'] +
  //                                       ((_countedComment > 1)
  //                                           ? LanguageBuilder
  //                                           .texts!['time_stamp']['suffix']
  //                                           : '')),
  //                                 ],
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         );
  //       } else {
  //         return const CircularProgressIndicator();
  //       }
  //     },
  //   );
  // }

  Widget listPostContent() {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, postState) {
        if (postState is PostLoaded) {
          return Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: postState.posts.length,
                itemBuilder: (BuildContext context, int index) {


                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<UserCubit, UserState>(
                            builder: (context, userState) {

                              if (userState is UserLoaded) {
                                final user = userState.users.firstWhere(
                                      (user) => user.uid == postState.posts[index],
                                  orElse: () => UserEntity(),
                                );

                                print("${userState.users}");
                                  return Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color:
                                                AppTheme.buttonBackgroundColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        margin:
                                            const EdgeInsets.only(right: 8.0),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          backgroundImage: user.imageUrl != null
                                              ? NetworkImage(
                                                  user.imageUrl.toString())
                                              : null,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user.fullName.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            user.datetime.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  );

                              }
                              return Container(); // or any other fallback widget if the userState is not UserLoaded or the user is not found
                            },
                          ),
                          SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: postState.posts[index].postContent
                                    .toString()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: 1.0,
                              mainAxisSpacing: 2.0,
                              crossAxisSpacing: 2.0,
                              padding: const EdgeInsets.all(2.0),
                              // Corrected line for the decoration property
                              clipBehavior: Clip.none,
                              children: List.generate(
                                postState.posts[index].postImages!.length,
                                (i) {
                                  return Container(
                                    margin: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey[700]!, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(postState
                                              .posts[index].postImages![i]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: i == 2 &&
                                              postState.posts[index].postImages!
                                                      .length >
                                                  3
                                          ? Center(
                                              child: Container(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                child: Text(
                                                  '+${postState.posts[index].postImages!.length - 3}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget listFriendsContent() {
    return SizedBox(
      height: 150,
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
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, userState) {
              if (userState is UserLoaded) {
                final user =
                    userState.users.firstWhere((u) => u.uid == widget.uid);

                return UserAccountsDrawerHeader(
                  accountName: Row(
                    children: [
                      Text(
                        user.fullName ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(${user.nickName})",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  accountEmail: Text(
                    user.position ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(user.imageUrl!),
                    radius: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue, // สีขอบ
                          width: 2.0, // ความกว้างของขอบ
                        ),
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
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
              var firebaseauth = FirebaseAuth.instance;
              print(firebaseauth.currentUser!.uid);
              await firebaseauth.signOut().then(
                    (value) =>
                        Navigator.pushNamed(context, AppRoute.loginRoute),
                  );
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
}
