// import 'package:doctor_r01/profile/profile_view.dart';

import 'package:doctor_r01/doctor_profile_setup/doctor_input_view.dart';
import 'package:doctor_r01/navbar/navi_controller.dart';
import 'package:doctor_r01/notification/notification_view.dart';
import 'package:doctor_r01/signup/signupa_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../appoinment/appoinment_view.dart';
import '../home/home_view.dart';
import '../main.dart';
import '../profile/profile_page.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final controller = Get.put(NaviController());
  final signupController = Get.put(SignupController());
  final naviBarController = Get.put(NaviColtroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => naviBarController.navigateToRegisterPage.value != true
        ? Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Obx(
              () => Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: EdgeInsets.all(12),
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  border: Border.all(
                      color: Color(0xff2dacb0), style: BorderStyle.solid),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 20),
                        blurRadius: 20)
                  ],
                ),
                child: NavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  indicatorColor: Colors.grey,
                  selectedIndex: controller.selectedIndex.value,
                  onDestinationSelected: (index) {
                    controller.selectedIndex.value = index;
                  },
                  destinations: [
                    NavigationDestination(
                      icon: Icon(
                        Iconsax.home5,
                        color: Colors.white,
                      ),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Iconsax.calendar5,
                        color: Colors.white,
                      ),
                      label: 'Appointment',
                    ),
                    NavigationDestination(
                        icon: Icon(
                          Iconsax.notification5,
                          color: Colors.white,
                        ),
                        label: 'Notification'),
                    NavigationDestination(
                      icon: Icon(
                        Icons.supervised_user_circle_sharp,
                        color: Colors.white,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),

            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //   padding: EdgeInsets.all(4),
            //   height: 60,
            //   decoration: BoxDecoration(
            //     color: Color(0xffcbf1c1),
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(24),
            //     ),
            //     boxShadow: [BoxShadow(color: Color(0xffcbf1c1).withOpacity(0.3), offset: Offset(0, 20), blurRadius: 20)],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             Icon(Iconsax.home5,size: 35,),Text("Home" ,style: TextStyle(height: 1, fontWeight: FontWeight.bold),)
            //           ],
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Icon(Iconsax.calendar5,size: 35),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Icon(Iconsax.notification5,size: 35),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Icon(Icons.supervised_user_circle_sharp,size: 35),
            //       ),
            //
            //       //
            //       // icon: Icon(Iconsax.calendar5), label: 'Appointment'),
            //       // icon: Icon(Iconsax.notification5), label: 'Notification'),
            //       //
            //       //   icon: Icon(Icons.supervised_user_circle_sharp),
            //       //   label: 'Profile',
            //       // ),
            //     ],
            //   ),
            // ),
            body: Container(
                child: controller.screens[controller.selectedIndex.value]),
          )
        : DoctorInputView());
  }
}

// Obx(
// () => Container(
// margin: EdgeInsets.all(20),
// child: NavigationBar(
// backgroundColor: Colors.red,
// height: 80,
// elevation: 0,
// selectedIndex: controller.selectedIndex.value,
// onDestinationSelected: (index) {
// controller.selectedIndex.value = index;
// },
// destinations: [
// NavigationDestination(
// icon: Icon(
// Iconsax.home5,
// ),
// label: 'Home',
// ),
// NavigationDestination(icon: Icon(Iconsax.calendar5), label: 'Appointment'),
// NavigationDestination(icon: Icon(Iconsax.notification5), label: 'Notification'),
// NavigationDestination(
// icon: Icon(Icons.supervised_user_circle_sharp),
// label: 'Profile',
// ),
// ],
// ),
// ),
// ),

class NaviController extends GetxController {
  final selectedIndex = 0.obs;

  final screens = [
    HomePage(),
    AppoinmentView(),
    NotificationView(),
    // ProfileView(),
    ProfilePage()
  ];
}
