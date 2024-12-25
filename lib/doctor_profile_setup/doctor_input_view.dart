import 'package:doctor_r01/doctor_profile_setup/doctor_input_controller.dart';
import 'package:doctor_r01/navbar/navi_controller.dart';
import 'package:doctor_r01/signup/signupa_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../navbar/navi.dart';
import 'user.dart';

class DoctorInputView extends GetView<DoctorInputController> {
  DoctorInputView({super.key});

  final naviBarController = Get.put(NaviColtroller());

  @override
  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Doctor Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: Ink.image(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80"),
                            fit: BoxFit.cover,
                            width: 128,
                            height: 128,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: ClipOval(
                          child: Container(
                              padding: EdgeInsets.all(3),
                              color: Theme.of(context).colorScheme.primary,
                              child: ClipOval(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  color: Theme.of(context).colorScheme.primary,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: controller.nameController.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: controller.nameController.value.text.isEmpty
                        ? Icon(Icons.vaccines)
                        : Icon(Icons.add_reaction_rounded),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.qualificationController.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your Qualification',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.vaccines),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.degreeController.value,
                  decoration: controller.degreeController.value.text.isEmpty
                      ? InputDecoration(
                          hintText: 'Enter your Degree',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Icon(Icons.vaccines),
                        )
                      : InputDecoration(
                          hintText: 'Enter your Degree',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Icon(Icons.add_reaction_rounded),
                        ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.fieldController.value,
                  decoration: controller.fieldController.value.text.isEmpty
                      ? InputDecoration(
                          hintText: 'Enter your Field',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Icon(Icons.vaccines),
                        )
                      : InputDecoration(
                          hintText: 'Enter your Field',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Icon(Icons.add_reaction_rounded),
                        ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.detailsController.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your Details',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.vaccines),
                  ),

                  maxLines: null, // Allow multiple lines for details
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.to(NavBar());
                    // Create a Doctor object with the input values
                    Doctor doctor = Doctor(
                      Uid: signupController.phoneNumberController.value.text,
                      name: controller.nameController.value.text,
                      qualification:
                          controller.qualificationController.value.text,
                      degree: controller.degreeController.value.text,
                      field: controller.fieldController.value.text,
                      details: controller.detailsController.value.text,
                    );

                    naviBarController.navigateToRegisterPage.value = false;

                    print(doctor.toString());

                    signupController.createUser(doctor);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
