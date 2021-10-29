import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/View/CredentialsScreen/CredentialsScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/ViewSitesScreen/ViewSitesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewSitesHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // drawer: Drawers().drawers(context),
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              expandedHeight: height / 6,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  child: Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 20, bottom: 8.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: DynamicColor().black.withOpacity(0.35),
                              ),
                            ),
                            SizedBox(
                              width: width / 20,
                            ),
                            Text(
                              'View Sites',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 18),
                            ),
                            Spacer(),
                            // Builder(builder: (context) {
                            //   return GestureDetector(
                            //     onTap: () {
                            //       Scaffold.of(context).openDrawer();
                            //     },
                            //     child: Icon(
                            //       Icons.menu,
                            //       size: width / 13,
                            //       color: DynamicColor().primarycolor,
                            //     ),
                            //   );
                            // }
                            // ),
                            SizedBox(
                              width: width / 20,
                            ),
                            // Spacer(),
                          ],
                        ),
                      ),
                      // Spacer(),
                      Spacer(),
                      Container(
                        width: width / 1.22,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  DynamicColor().primarycolor.withOpacity(0.25),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          cursorColor: DynamicColor().primarycolor,
                          style: GoogleFonts.poppins(
                              color: DynamicColor().black,
                              fontWeight: FontWeight.w600),

                          decoration: new InputDecoration(
                              hintText: '',
                              labelStyle: TextStyle(color: Colors.black),
                              focusColor: DynamicColor().titletextcolor,
                              hoverColor: DynamicColor().black,
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.search,
                                color: DynamicColor().titletextcolor,
                              ),
                              border: InputBorder.none),
                          // keyboardType: TextInputType.none,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              pinned: true,
              floating: true,
            ),
          ];
        },
        body: ViewSitesScreen(),
        // body:
        // TabBarView(
        //   children: <Widget>[
        //     new MyProfileScreen(),
        //     new CredentialsScreen(),
        //     // new CallScreen(),
        //   ],
        // ),
      )),
    );
  }
}
