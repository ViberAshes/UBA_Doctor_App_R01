import 'package:doctor_r01/firebase_connectivity/Connectivity_var.dart';
import 'package:doctor_r01/wrapper/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../doctor_profile_setup/user.dart';

class SignupController extends GetxController {
  var phoneNumberController = TextEditingController().obs;
  var countryCode = 0.obs;

// otp auth var

  // var focusNode = FocusNode().obs;
  var formKey = GlobalKey<FormState>().obs;

  var code = ''.obs;
  var pinController = TextEditingController().obs;

  var otpController = TextEditingController().obs;

  var phoneEntryView = true.obs;
  var otpEntryView = false.obs;
  var registerEntryView = false.obs;

  // final ConnectivityVariables connect = Get.put(ConnectivityVariables());
  final db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  createUser(Doctor doctor) async {
    // await _db
    //     .collection("users")
    //     .add(user.toJson())
    User? user = auth.currentUser;

    DocumentReference userDocRef = db.collection('doctors').doc(user?.uid);
    await userDocRef
        .set(doctor.toMap())
        .whenComplete(() => Get.snackbar(
            "Success", "You account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

// used in PhoneEnteryView
  var verifyId = "".obs;
  sendcode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + phoneNumberController.value.text,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('!!! Error', e.code);
        },
        codeSent: (
          String vid,
          int? token,
        ) {
          verifyId.value = vid;
          // Get.to(
          //   OTPVerifyView(
          //     vid: vid,
          //   ),
          // );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Occure", e.code);
    } catch (e) {
      Get.snackbar("Error Occured", e.toString());
    }
  }

  ///used in NavBarController

  var status = false.obs;
  final UserFire = FirebaseAuth.instance.currentUser;

// used in OtpEneryView
  User? user = FirebaseAuth.instance.currentUser;
  var isDoctorRegistered = false.obs;
  Future<void> signin() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verifyId.value,
      smsCode: code.value,
    );

    // if (isCurrentUserADoctor() == true) {
    //   isDoctorRegistered.value = true;
    // } else {
    //   isDoctorRegistered.value = false;
    // }

    // write query of if user already exist the call wraper() class
    // if not the call doctourinputeview() to get details

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {});
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Occurred", e.code);
    } catch (e) {
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  signOutFire() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Sign-out successful
    } catch (e) {
      // An error occurred during sign-out
      Get.snackbar("Error signing out: ", 'due to: $e');
      print("Error signing out: $e");
    }
    otpEntryView.value = false;

    phoneEntryView.value = true;
    Get.to(Wrapper());
  }

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
      return false;
    } else {
      print("id is really exist");
      print(snapShot.id.toString());
      return true;
    }
  }

  ///
  ///

  // Future<bool> isCurrentUserADoctor() async {
  //   isDocumentExist();
  //   // Get the current user's UID
  //   User? loginUser = FirebaseAuth.instance.currentUser;
  //   // FirebaseFirestore.instance
  //   //     .collection('userNames')
  //   //     .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //   //     .get()
  //   //     .then((value) {
  //   //   value.docs.forEach((element) {
  //   //     print(element.id);
  //   //   });
  //   // });
  //   try {
  //     // Query Firestore to check if any document matches the current user's UID
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('doctors')
  //         .where('uid', isEqualTo: loginUser?.uid)
  //         .limit(1)
  //         .get();

  //     // If there are documents returned, it means the user is a doctor
  //     return true;
  //   } catch (e) {
  //     print("Error checking if user is a doctor: $e");
  //     return false;
  //   }
  // }

  // Future<bool> isDocumentExist() async {
  //   try {
  //     // Query Firestore to check if any document matches the current user's UID
  //     print('red entered');

  //     await FirebaseFirestore.instance
  //         .collection('doctors')
  //         .where('FirebaseAuth.instance.currentUser!.uid',
  //             isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((element) {
  //         if (FirebaseAuth.instance.currentUser!.uid == element.id) {
  //           print('red alert');

  //           print(element.id);
  //           print('red alert');
  //         }
  //         print(element.id.toString());
  //       });
  //     });
  //     print('red not entered');

  //     // If there are documents returned, it means the user is a doctor
  //     return true;
  //   } catch (e) {
  //     print('red thrown');

  //     print("Error checking if user is a doctor: $e");
  //     return false;
  //   }
  // }

  // User? loginUser = FirebaseAuth.instance.currentUser;

  // Future<bool> isDocumentNameSimilarToUid(String uid) async {
  //   try {
  //     // Reference to the Firestore collection
  //     CollectionReference<Map<String, dynamic>> collectionRef =
  //         FirebaseFirestore.instance.collection('doctors');

  //     // Get the document snapshot with the same ID as the user's UID
  //     DocumentSnapshot<Map<String, dynamic>> snapshot =
  //         await collectionRef.doc(loginUser!.uid).get();

  //     // Return true if the document exists, otherwise false
  //     return snapshot.exists;
  //   } catch (e) {
  //     // Handle any errors
  //     print('Error checking document name similarity to UID: $e');
  //     return false;
  //   }
  // }
}
