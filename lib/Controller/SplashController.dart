import 'dart:async';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var updates = false.obs;
  var url = ''.obs;
  var context;
  var connection = true.obs;
  check() async {
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;
        checkUpdate();
        update();
      } else {
        connection.value = false;
        update();
      }
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // check();
    // checkUpdate();
  }

  checkUpdate() async {
    var response = await API().CheckUpdate();
    if (response.statusCode == 200) {
      updates.value = response.data['response']['updateAvailability'];
      if (updates.value == true) {
        url.value = response.data['response']['link'];
        BaseUrl.url = url.value;
        // print(updateController.url);
      }
      checks();
    } else {
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  checks() {
    if (updates.value == false) {
      var tokenval = BaseUrl.storage.read("token");
      BaseUrl.storage1.read('seen') ?? false;
      Future.delayed(new Duration(milliseconds: 500), () {
        if (tokenval != "out") {
          if (tokenval != null) {
            Get.offAllNamed('/home');
          } else if (BaseUrl.storage1.read('seen') == true) {
            Get.offAllNamed('/signinemp');
          } else {
            BaseUrl.storage1.write('seen', true);
            Get.offAllNamed('/intro');
          }
        } else if (BaseUrl.storage1.read('seen') == true) {
          Get.offAllNamed('/signinemp');
        } else {
          BaseUrl.storage1.write('seen', true);
          Get.offAllNamed('/intro');
        }
      });
    } else {
      Get.offAllNamed('/updatescreen');
      // return showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (_) => AlertDialog(
      //           // content: Text(
      //           //   'Kindly Update Your Application',
      //           //   style: GoogleFonts.poppins(
      //           //       fontWeight: FontWeight.w300, fontSize: 15),
      //           // ),
      //           actions: [
      //             Column(
      //               children: [
      //                 Stack(
      //                   children: [
      //                     Container(
      //                       width: MediaQuery.of(context).size.width / 1.2,
      //                       height: MediaQuery.of(context).size.height / 3.5,
      //
      //                       // width: double.infinity,
      //                       alignment: Alignment.bottomCenter,
      //                       padding: EdgeInsets.only(top: 120.0),
      //                       decoration: BoxDecoration(
      //                           color: Color(0xFFF2F5FF),
      //                           borderRadius: BorderRadius.only(
      //                               bottomLeft: Radius.circular(5.0),
      //                               bottomRight: Radius.circular(5.0))),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Container(
      //                             width: MediaQuery.of(context).size.width / 2,
      //                             child: Text(
      //                               'Improve ',
      //                               style: GoogleFonts.poppins(
      //                                   fontWeight: FontWeight.w300,
      //                                   fontSize: 12),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Container(
      //                       width: MediaQuery.of(context).size.width / 1.2,
      //                       height: MediaQuery.of(context).size.height / 8,
      //                       // width: double.infinity,
      //                       padding: EdgeInsets.all(12.0),
      //                       decoration: BoxDecoration(
      //                           image: DecorationImage(
      //                               image: AssetImage('assets/updatebg.png'),
      //                               fit: BoxFit.fitWidth)),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             'What\'s New',
      //                             style: GoogleFonts.poppins(
      //                                 fontWeight: FontWeight.w600,
      //                                 fontSize: 18),
      //                           ),
      //                           Container(
      //                             width: MediaQuery.of(context).size.width / 2,
      //                             child: Text(
      //                               'Find out what\'s include in this update',
      //                               style: GoogleFonts.poppins(
      //                                   fontWeight: FontWeight.w300,
      //                                   fontSize: 12),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Row(
      //                   children: [
      //                     Spacer(),
      //                     ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                             primary: DynamicColor().primarycolor),
      //                         onPressed: () async {
      //                           url.value.toString();
      //                           //print(url.value);
      //                           if (await canLaunch(url.value)) {
      //                             await launch(
      //                               url.value,
      //                               forceSafariVC: false,
      //                               forceWebView: false,
      //                               headers: <String, String>{
      //                                 'my_header_key': 'my_header_value'
      //                               },
      //                             );
      //                           } else {
      //                             throw 'Could not launch ${url.value}';
      //                           }
      //                         },
      //                         child: const Text('Update')),
      //                     Spacer(),
      //                     TextButton(
      //                         style: TextButton.styleFrom(
      //                             primary: DynamicColor().primarycolor,
      //                             textStyle: TextStyle(
      //                                 color: DynamicColor().primarycolor)),
      //                         onPressed: () => exit(0),
      //                         child: const Text('No')),
      //                     Spacer(),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ));
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
