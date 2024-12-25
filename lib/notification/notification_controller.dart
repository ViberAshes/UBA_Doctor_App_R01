import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

import '../appoinment/model/appoinment_set_get.dart';

class NotificationController extends GetxController {
  var listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 1',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 2',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 3',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 4',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 44),
      ),
      leading: Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 5',
      subtitle: 'We believe in the power of mobile computing.',
    ),
  ].obs;

  @override
  void onInit() {
    getNotifications();

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var notifications = [].obs;

  Future getNotifications() async {
    notifications;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('appointments').get();

    snapshot.docs.forEach((doc) {
      Appointment notification = Appointment.fromMap(doc.data(), doc.id);
      print(notification.toJson().toString());
      notifications.add(notification);
    });

    return notifications;
  }
}
