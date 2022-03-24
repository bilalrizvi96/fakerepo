import 'package:flutter/material.dart';

class HistoryCheckPointScreen extends StatelessWidget {
  const HistoryCheckPointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Color(0xFFEBEFFF),
      ),
    );
  }
}
