import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class GenrateQrScreen extends StatelessWidget {
  // const GenrateQrScreen({Key? key}) : super(key: key);
  var data = Get.parameters['data'];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawers().drawers(context),
      body: SafeArea(
        child: Container(
            width: width,
            height: height,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Image.asset(
                    'assets/genrateqrbg.png',
                    fit: BoxFit.contain,
                    width: width,
                    height: height,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 22.0, left: 22.0, top: 22.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    Text(
                      'Generated QR Code',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: width / 20,
                          color: DynamicColor().primarycolor),
                    ),
                    SizedBox(
                      height: height / 9,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.black),
                          color: Colors.white),
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.qr_code_sharp,
                        color: Colors.black.withOpacity(0.75),
                        size: width / 3,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: height / 3.2,
                      width: width,
                      decoration: BoxDecoration(
                        color: DynamicColor().primarycolor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0)),
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Share.share(
                                'check out my website https://example.com'),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/share.png",
                                  width: width / 6,
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Text(
                                  'Share',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 20,
                                      color: DynamicColor().white),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/or.png',
                            width: width / 3.5,
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/download.png",
                                width: width / 6,
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                'Download',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 20,
                                    color: DynamicColor().white),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
