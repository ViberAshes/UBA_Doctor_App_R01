import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NaviColtroller extends GetxController {
  @override
  void onInit() {
    checkDocuement();

    super.onInit();
  }

  var navigateToRegisterPage = true.obs;
  User? loginUser = FirebaseAuth.instance.currentUser;
  Future checkDocuement() async {
    final snapShot = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(loginUser!.uid) // varuId in your case
        .get();

    if (snapShot == null || !snapShot.exists) {
      // docuement is not exist
      print('id is not exist');
      print('id is not exist');
      navigateToRegisterPage.value = true;
      return true;
    } else {
      print("id is really exist");
      print(snapShot.id.toString());
      navigateToRegisterPage.value = false;
      return false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
