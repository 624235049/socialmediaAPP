import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/feature/home/presentation/pages/home_pages.dart';
import 'common/Language/language.dart';
import 'common/config/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      home: LanguageBuilder(
        defaultLanguage: 'en',
        useDeviceLanguage: false,
        textsMap: Languages.languages,
        child:  HomePage()),
    );
  }
}
