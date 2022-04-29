import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/ExpandedWideget.dart';
import '../../Model/item.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({Key? key}) : super(key: key);

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
                    'F.A.Q\'s',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: width / 16),
                  ),
                ],
              ),
              SizedBox(
                height: height / 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 25.0,
                    left: 25.0,
                  ),
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/faqsdetails');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width / 1.23,
                              height: height / 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 4,
                                      blurRadius: 6,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Icon(Icons.perm_contact_cal_rounded,
                                      color: DynamicColor().primarycolor),
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Text(
                                    'My Account',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 22),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_sharp,
                                      size: 30,
                                      color: DynamicColor().primarycolor),
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: ListView.builder(
//       itemCount: itemData.length,
//       itemBuilder: (context, index) {
//         return CustomExpansionPanelList(
//           // expandedHeaderPadding: EdgeInsets.all(10),
//           // elevation: 6.0,
//           animationDuration: Duration(milliseconds: 500),
//           children: [
//             ExpansionPanel(
//               canTapOnHeader: true,
//               headerBuilder:
//                   (BuildContext context, bool isExpanded) {
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 10),
//                   padding: EdgeInsets.all(10),
//                   child: Row(
//                     children: [
//                       Icon(Icons.perm_contact_cal_rounded,
//                           color: DynamicColor().primarycolor),
//                       SizedBox(
//                         width: width / 20,
//                       ),
//                       Text(
//                         itemData[index].headerItem,
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               body: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         itemData[index].discription,
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: 15,
//                           height: 1.3,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               isExpanded: itemData[index].expanded,
//             )
//           ],
//           expansionCallback: (int item, bool status) {
//             setState(() {
//               itemData[index].expanded =
//                   !itemData[index].expanded;
//             });
//           },
//         );
//       },
//     ),
//   ),
// )
