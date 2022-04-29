import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';
import '../../Component/ExpandedWideget.dart';
import '../../Model/item.dart';

class FAQsDetailScreen extends StatefulWidget {
  const FAQsDetailScreen({Key? key}) : super(key: key);

  @override
  State<FAQsDetailScreen> createState() => _FAQsDetailScreenState();
}

class _FAQsDetailScreenState extends State<FAQsDetailScreen> {
  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
        headerItem: 'Phone Number',
        discription: "Please contact your regional HR for this action..",
        colorsItem: Colors.green,
        expanded: false),
  ];

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
                    'My Account',
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
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: itemData.length,
                    itemBuilder: (context, index) {
                      return ExpansionPanelList(
                        // expandedHeaderPadding: EdgeInsets.all(10),
                        // elevation: 6.0,
                        animationDuration: Duration(milliseconds: 500),
                        children: [
                          ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Text(
                                      itemData[index].headerItem,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            body: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      itemData[index].discription,
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        height: 1.3,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 100,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: DynamicColor().primarycolor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            isExpanded: itemData[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            itemData[index].expanded =
                                !itemData[index].expanded;
                          });
                        },
                      );
                    },
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
