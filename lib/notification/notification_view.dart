import 'dart:ffi';

import 'package:doctor_r01/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class NotificationView extends GetView<NotificationController> {
  final notificationController = Get.put(NotificationController());
  static var bg_color = ["0xffFEF8DD", "0xffE1F8DC", "0xffeec9d2"];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black26,
        // color: HexColor(ColorSelect.row_bg_colors[childindex % 3]),
        // static var row_bg_colors = ["#FEF8DD", "#E1F8DC", "#eec9d2"];

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                StackedNotificationCards(
                  cardsSpacing: 10,
                  cardCornerRadius: 40,
                  titleTextStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  subtitleTextStyle: TextStyle(fontSize: 12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 19.0,
                    )
                  ],
                  notificationCardTitle: 'Appoinmnet',
                  notificationCards: [
                    ...notificationController.listOfNotification
                  ],
                  cardColor: Color(0xFFF1F1F1),
                  padding: 8,
                  actionTitle: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  showLessAction: Text(
                    'Show less',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  onTapClearAll: () {
                    notificationController.listOfNotification.clear();
                  },
                  clearAllNotificationsAction: Icon(Icons.close),
                  clearAllStacked: Text('Clear All'),
                  cardClearButton: Text('clear'),
                  cardViewButton: Text('view'),
                  onTapClearCallback: (index) {
                    print(index);
                    notificationController.listOfNotification.removeAt(index);
                  },
                  onTapViewCallback: (index) {
                    print(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
