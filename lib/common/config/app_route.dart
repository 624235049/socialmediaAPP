
import 'package:flutter/material.dart';
import 'package:mfecinternship/feature/home/presentation/pages/create_post_pages.dart';
import 'package:mfecinternship/feature/home/presentation/pages/friend_list.dart';
import 'package:mfecinternship/feature/home/presentation/pages/home_pages.dart';
import 'package:mfecinternship/feature/regis/presentation/pages/regis_pages.dart';

import '../../feature/auth/presentation/pages/login_pages.dart';
import '../../feature/home/presentation/pages/gallery_pages.dart';

class AppRoute {

  static const homeRoute = "home";
  static const registerRoute = "Register";
  static const loginRoute = "Login";
  static const commentDetail = "CommentDetail";
  static const createPost = "CreatePost";
  static const friendlist =  "FriendList";
  static const galleyRoute =  "GalleyRoute";


  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(uid: '',),
    registerRoute: (context) => RegistrationPage(),
    loginRoute: (context) => const LoginPage(),
    createPost: (context) =>  const CreatePost(images: [], uid: "",),
    friendlist: (context) =>   FriendList(),
    galleyRoute: (context) =>   const MyGalleryPage(uid: ""),
  };

  get getAll => _route;
}