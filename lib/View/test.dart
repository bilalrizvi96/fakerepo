// import 'dart:convert';
//
// import 'package:encrypt/encrypt.dart' as enc;
// import 'package:flutter/material.dart';
//
// import 'dart:math';
//
// class test extends StatefulWidget {
//   @override
//   _testState createState() => _testState();
// }
//
// class _testState extends State<test> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   static enc.Encrypted? encrypted;
//   static encryptAES(plainText) {
//     final key = enc.Key.fromUtf8("123np@U'vgy99`K`;^NcxRb1231.....");
//     final iv = enc.IV.fromLength(16);
//     final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.ctr));
//     encrypted = encrypter.encrypt(plainText, iv: iv);
//
//     print(encrypted!.base64);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     Random random = new Random();
//     int randomNumber = random.nextInt(1000);
//     int randomNumber2 = random.nextInt(10000);
//     var value = "${randomNumber.toString()}" +
//         "np@U'vgy99`K`;^NcxRb" +
//         "${randomNumber2.toString()}";
//     String credentials = value;
//     Codec<String, String> stringToBase64 = utf8.fuse(base64);
//     String encoded = stringToBase64.encode(credentials);
//     print(encoded);
//     String decoded = stringToBase64.decode(encoded);
//     print(decoded);
//   }
// }
