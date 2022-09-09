import 'package:flutter/material.dart';

class ErrorLoading extends StatelessWidget {
  ErrorLoading({this.width, this.height});
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/1.gif",
        height: height,
        width: width,
      ),
    );
  }
}
