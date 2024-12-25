import 'package:doctor_r01/signup/signupa_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DoctorInputController extends GetxController {
  var nameController = TextEditingController().obs;

  var qualificationController = TextEditingController().obs;

  var degreeController = TextEditingController().obs;

  var fieldController = TextEditingController().obs;

  var detailsController = TextEditingController().obs;
  final SignupController signupController = Get.put(SignupController());

  var isDoctorRegistered = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    // if (signupController.isCurrentUserADoctor() == true) {
    //   Get.to(NavBar());
    // }
  }
}
