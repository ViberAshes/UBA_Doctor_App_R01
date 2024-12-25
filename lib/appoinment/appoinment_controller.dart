import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/appoinment_set_get.dart';

class AppoinmentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late TabController bottomController;

  @override
  void onInit() {
    getAppointments();

    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    // tabController.dispose();
    // bottomController.dispose();
    super.dispose();
  }

  var appointments = [].obs;

  Future getAppointments() async {
    appointments;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('appointments').get();

    snapshot.docs.forEach((doc) {
      Appointment appointment = Appointment.fromMap(doc.data(), doc.id);
      print(appointment.toJson().toString());
      appointments.add(appointment);
    });

    return appointments;
  }
}
