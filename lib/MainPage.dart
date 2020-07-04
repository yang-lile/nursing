import 'package:Nursing_Home/FunctionPage.dart';
import 'package:Nursing_Home/about.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final clickAble = [false, true, true];
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: PageController(initialPage: 0),
      children: [
        buildPage('asset/page_picture/主页.png', 0),
        buildPage("asset/page_picture/功能.png", 1),
        buildPage("asset/page_picture/关于.png", 2),
      ],
    );
  }

  buildPage(String name, int i) {
    return AbsorbPointer(
      absorbing: !clickAble[i],
      child: GestureDetector(
        onTap: () {
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FunctionPage(),
              ),
            );
          } else if (i == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => About(),
              ),
            );
          }
        },
        child: Image.asset(
          name,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
