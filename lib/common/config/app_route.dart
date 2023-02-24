
import 'package:flutter/material.dart';
import 'package:mfecinternship/feature/home/presentation/pages/create_post.dart';
import 'package:mfecinternship/feature/home/presentation/pages/home_pages.dart';
import 'package:mfecinternship/feature/regis/presentation/pages/regis_pages.dart';

import '../../feature/auth/presentation/pages/login_pages.dart';

class AppRoute {

  static const homeRoute = "home";
  static const registerRoute = "Register";
  static const loginRoute = "Login";
  static const commentDetail = "CommentDetail";
  static const createPost = "CreatePost";



  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    registerRoute: (context) => RegistrationPage(),
    loginRoute: (context) => LoginPage(),
    createPost: (context) => CreatePost(),
  };

  get getAll => _route;
}