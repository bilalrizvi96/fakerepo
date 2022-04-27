import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPointScreen extends StatelessWidget {
  const MyPointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/faqsbg.png'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Column(
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
                        'My Points',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: width / 16),
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: width,
                    height: height / 1.35,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height / 6,
                        ),
                        Expanded(
                          child: Container(
                            width: width,
                            height: height,
                            padding:
                                EdgeInsets.only(left: 20.0, top: 5, right: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.60)),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height / 20,
                                ),
                                Text(
                                  '07 APR 2022, 02:11 PM',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: width / 35),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Registration',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 23),
                                    ),
                                    Spacer(),
                                    Text(
                                      '+10',
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 22),
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  top: height / 2.8,
                  right: width / 3.5,
                  left: width / 3.5,
                  child: Container(
                    width: 100,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        gradient: new LinearGradient(
                            colors: [
                              Color(0xFFEC4A22),
                              Color(0xFFF2892C),
                            ],
                            stops: [
                              0.6,
                              2.2
                            ],
                            begin: FractionalOffset.topRight,
                            end: FractionalOffset.topLeft,
                            tileMode: TileMode.mirror),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      'Point History',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: width / 24),
                    ),
                  )),
              Positioned(
                top: height / 7,
                right: width / 10,
                left: width / 10,
                child: Container(
                  width: width / 1.3,
                  height: height / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/mypointbg.png'),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width / 35,
                          ),
                          Column(
                            children: [
                              Text(
                                '${BaseUrl.storage.read('name').toString().split(' ')[0] + ' ' + BaseUrl.storage.read('name').toString().split(' ')[1]}',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: width / 21),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.white30,
                                    size: width / 26,
                                  ),
                                  SizedBox(
                                    width: width / 40,
                                  ),
                                  Text(
                                    '${BaseUrl.storage.read('empCode')}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white30,
                                        fontSize: width / 28),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Points',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: width / 30),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${BaseUrl.storage.read('points')}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: width / 16),
                                  ),
                                  SizedBox(
                                    width: width / 40,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellowAccent,
                                    size: width / 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width / 35,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width / 35,
                          ),
                          Container(
                            width: width / 4.5,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.stars_sharp,
                                  size: width / 25,
                                  color: Colors.purple,
                                ),
                                Spacer(),
                                Text(
                                  'Basic',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.purple,
                                      fontSize: width / 28),
                                ),
                                Spacer(),
                                Spacer(),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.help_outline,
                            size: width / 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width / 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
