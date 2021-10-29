import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/View/CredentialsScreen/CredentialsScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTabViewScreen extends StatelessWidget {
  const ProfileTabViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawers().drawers(context),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  expandedHeight: height / 8,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 20, bottom: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                'My Profile',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 16),
                              ),
                              Spacer(),
                              Builder(builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    size: width / 13,
                                    color: DynamicColor().primarycolor,
                                  ),
                                );
                              }),
                              SizedBox(
                                width: width / 20,
                              ),
                              // Spacer(),
                            ],
                          ),
                        ),
                        // Spacer(),
                        Spacer(),
                      ],
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: DynamicColor().titletextcolor,
                    labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: width / 25),
                    labelColor: DynamicColor().black,
                    indicatorColor: DynamicColor().primarycolor,
                    labelPadding: EdgeInsets.only(
                      right: 80.0,
                      left: 80.0,
                    ),
                    tabs: [
                      Tab(
                        text: 'Profile',
                      ),
                      Tab(
                        text: 'Credentials',
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                new MyProfileScreen(),
                new CredentialsScreen(),
                // new CallScreen(),
              ],
            ),
          )),
    );
  }
}
