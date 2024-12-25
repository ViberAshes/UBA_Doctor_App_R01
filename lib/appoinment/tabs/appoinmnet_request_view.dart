import 'package:doctor_r01/appoinment/appoinment_controller.dart';
import 'package:doctor_r01/signup/signupa_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../model/appoinment_set_get.dart';

class AppoinmentRequestView extends GetView {
  AppoinmentRequestView({super.key});
  final signupController = Get.put(SignupController());

  final appoinmentController = Get.put(AppoinmentController());
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<List<Appointment>>(
    //   future: appoinmentController.getAppointments(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     } else {

    //         List<Appointment> appointments = snapshot.data!;

    //         return ListView.builder(
    //           itemCount: appointments.length,
    //           itemBuilder: (context, index) {
    //             Appointment appointment = appointments[index];
    //             return ListTile(
    //               title: Text(appointment.name ?? "name"),
    //               subtitle: Text(appointment.phone ?? "phone"),
    //               trailing: Text(appointment.appointmentDate ?? "date"),
    //             );
    //           },
    //         );
    //       }
    //     },
    //   );
    // }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: appoinmentController.appointments.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Appointment appointment =
                    appoinmentController.appointments[index];

                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.network(
                                    'https://avatar.iran.liara.run/public/boy?username=Ash', // Replace with your image asset path
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.note, size: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 2),
                                      child: Text(
                                        'Age: 30',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.note,
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 2),
                                      child: Text(
                                        'Sex: Male',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.near_me, size: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2),
                                        child: Text(
                                          appointment.name ?? 'John Doe',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_enabled_rounded,
                                        size: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2),
                                        child: Text(
                                          appointment.phone ?? '+1234567890',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        size: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2),
                                        child: Text(
                                          '23-4-2024',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2),
                                        child: Text(
                                          '10:30 am',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          signupController.signOutFire();
                                        },
                                        child: Text('Logout'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          signupController.checkDocuement();
                                        },
                                        child: Text('Reject'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Right Side: Vertical Schedule Button
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
