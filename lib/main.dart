import 'package:Nursing_Home/MainPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final primryColor = Color(0xffb1d4bc);
  final scaffoldBackgroundColor = Color(0xffa8d0ae);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '优尔键养老综合系统',
      home: MainPage(),
      theme: ThemeData(
        primaryColor: primryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
    );
  }
}
