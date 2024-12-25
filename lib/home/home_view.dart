import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xff2dacb0),
                  // color: Color(0xffcbf1c1),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      // Image.asset("assets/images/bg_main.png",),
                      // Positioned(
                      //
                      //   child: Align(
                      //       alignment: AlignmentDirectional.centerEnd,
                      //       child: Transform.rotate(
                      //         angle: 120,
                      //         child: Container(
                      //           height: 200,
                      //           width: 200,
                      //           decoration: BoxDecoration(color: Color(0xffcbf1c1), borderRadius: BorderRadiusDirectional.circular(45), boxShadow: [
                      //             new BoxShadow(
                      //               color: Colors.black38,
                      //               blurRadius: 20.0,
                      //             ),
                      //           ]),
                      //         ),
                      //       )
                      //
                      //       /*Image.asset(
                      //         "assets/images/plus.png",
                      //         height: 150,
                      //       )*/
                      //       ),
                      // ),
                      Positioned(
                        top: 60,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.greetUser(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white54)),
                            Text("Dr. Oliver Yew",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.white)),
                          ],
                        ),
                      ),

                      Positioned(
                        top: 125,
                        left: 10,
                        child: FlutterSwitch(
                          activeColor: Colors.green,
                          width: 85.0,
                          height: 30.0,
                          inactiveText: "Offline",
                          activeText: "Online",
                          activeToggleColor: Colors.greenAccent.shade400,
                          activeTextColor: Colors.white,
                          valueFontSize: 12.0,
                          toggleSize: 20.0,
                          value: controller.status.value,
                          borderRadius: 30.0,
                          padding: 6.0,
                          showOnOff: true,
                          onToggle: (val) {
                            controller.status.value = val;
                          },
                        ),
                      ),
                      Positioned(
                        right: -50,
                        top: 90,
                        child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Transform.rotate(
                              angle: 120,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xffcbf1c1),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(45),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 50.0,
                                      ),
                                    ]),
                              ),
                            )

                            /*Image.asset(
                            "assets/images/plus.png",
                            height: 150,
                          )*/
                            ),
                      ),
                      Positioned(
                        right: -45,
                        top: -90,
                        child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Transform.rotate(
                              angle: 120,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xffcbf1c1),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 40.0,
                                      ),
                                    ]),
                              ),
                            )

                            /*Image.asset(
                            "assets/images/plus.png",
                            height: 150,
                          )*/
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15),
                  child: Text(
                    "Next Consultantion",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          margin: EdgeInsets.only(
                              right: 10, left: 10, top: 0, bottom: 10),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(25)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 40),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_rounded,
                                        color: Color(0xf12dacb0),
                                        fill: CircularProgressIndicator
                                            .strokeAlignCenter,
                                        size: 19,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Sara Allie",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, left: 8, right: 8, bottom: 2),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Gender",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                        Text(
                                          "Age",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                        Text(
                                          "History",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, left: 8, right: 8, bottom: 2),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Female",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                        Text(
                                          "20",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                        Text(
                                          "1st Time",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Time",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ),
                              Text(
                                "12:30 PM",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightGreen.shade500),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //  Text("Booking"),
                // Container(
                //   height: 300,
                //   color: Colors.white54,
                //   width: MediaQuery.of(context).size.width,
                //   child:  Text("Data"),
                // ),
              ],
            ),
          ),
        ));
  }
}
