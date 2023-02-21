
import 'package:flutter/material.dart';
import 'package:mfecinternship/feature/home/presentation/pages/home_pages.dart';
import 'package:mfecinternship/feature/regis/presentation/pages/regis_pages.dart';

class AppRoute {

  static const homeRoute = "home";
  static const registerRoute = "Register";


  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    registerRoute: (context) => RegistrationPage(),

  };

  get getAll => _route;
}