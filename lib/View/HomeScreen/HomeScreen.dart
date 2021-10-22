import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.grey[350],
        child: Stack(
          children: [
            Container(
              width: width,
              height: height / 3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFB92E34),
                      Color(0xFFB31B1B),
                      Color(0xFFFF2400),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100.0),
                      bottomLeft: Radius.circular(100.0))),
            ),
            Positioned(
              top: height / 8.6,
              left: width / 10,
              child: Text(
                'Dashboard',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width / 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: height / 4.6,
              left: width / 12,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: width / 1.2,
                  height: height / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/person.jpeg'),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'Emad Khan',
                        style: TextStyle(
                            color: Colors.black, fontSize: width / 25),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        'EMP ID - 32',
                        style:
                            TextStyle(color: Colors.grey, fontSize: width / 30),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        'CTO',
                        style: TextStyle(
                            color: Colors.black, fontSize: width / 28),
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFB92E34).withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFB92E34),
                                    Color(0xFFB31B1B),
                                    Color(0xFFFF2400),
                                  ],
                                )),
                            child: Icon(
                              Icons.receipt,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFB92E34),
                                    Color(0xFFB31B1B),
                                    Color(0xFFFF2400),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFB92E34).withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Icon(
                              Icons.receipt,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFB92E34).withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFB92E34),
                                    Color(0xFFB31B1B),
                                    Color(0xFFFF2400),
                                  ],
                                )),
                            child: Icon(
                              Icons.receipt,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFB92E34),
                                    Color(0xFFB31B1B),
                                    Color(0xFFFF2400),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFB92E34).withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Icon(
                              Icons.receipt,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
