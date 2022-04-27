import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 20,
                  ),
                  Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
                  SizedBox(
                    width: width / 20,
                  ),
                  Text(
                    'Notification',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: width / 16),
                  ),
                  SizedBox(
                    width: width / 20,
                  ),
                ],
              ),
              SizedBox(
                height: height / 40,
              ),
              Container(
                height: height / 3.0,
                child: Stack(
                  children: [
                    Container(
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFE7EFFE)),
                    ),
                    Positioned(
                      top: height / 12,
                      child: Container(
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
