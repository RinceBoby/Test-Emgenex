import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/constants/colors.dart';
import 'package:test_app/view/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kWhite,
      ),
      home: LoginPage(),
    );
  }
}
