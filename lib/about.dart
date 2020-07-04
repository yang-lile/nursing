import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "asset/page_picture/介绍.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
