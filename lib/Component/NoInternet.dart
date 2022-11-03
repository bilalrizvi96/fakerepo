import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(
        //   height: height / 15,
        // ),
        Image.asset('assets/nointernet.gif'),
        SizedBox(
          height: height / 30,
        ),
        // Spacer(),
        Text(
          "No Internet Connection",
          style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.50),
              fontWeight: FontWeight.w600,
              fontSize: width / 22),
        ),
        // Spacer(),
      ],
    );
  }
}
