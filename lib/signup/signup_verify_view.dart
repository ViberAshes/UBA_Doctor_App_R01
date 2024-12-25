// import 'package:animate_do/animate_do.dart';
// import 'package:doctor_r01/signup/signupa_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pinput/pinput.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// import '../main.dart';
// import '../wrapper/wrapper.dart';

// class OTPVerifyView extends GetView<SignupController> {
//   @override
//   OTPVerifyView({super.key});
//   final controller = Get.put(SignupController());

//   var focusedBorderColor = Color.fromRGBO(6, 10, 10, 1);
//   var fillColor = Color.fromRGBO(243, 246, 249, 0);
//   var borderColor = Color.fromRGBO(1, 11, 9, 0.4);
//   final defaultPinTheme = PinTheme(
//     width: 56,
//     height: 56,
//     textStyle: GoogleFonts.poppins(
//       fontSize: 22,
//       color: const Color.fromRGBO(30, 60, 87, 1),
//     ),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(19),
//       border: Border.all(color: Color.fromRGBO(32, 21, 21, 1)),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         appBar: AppBar(
//           title: Text('OTP Verification'),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//                 Colors.purple.shade300,
//                 Colors.white24,
//               ],
//             ),
//           ),
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FadeInUp(
//                       duration: const Duration(seconds: 1),
//                       child: Container(
//                         height: MediaQuery.of(context).size.height / 2.3,
//                         decoration: const BoxDecoration(
//                             image: DecorationImage(
//                           image: AssetImage(
//                             'assets/images/verify_otp_doctor.png',
//                           ),
//                           fit: BoxFit.cover,
//                         )),
//                       )),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   FadeInUp(
//                       duration: const Duration(seconds: 1),
//                       child: const Text(
//                         "Phone No. Verification",
//                         style: TextStyle(
//                             color: Color.fromRGBO(0, 0, 0, 1),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18),
//                       )),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   FadeInUp(
//                       duration: const Duration(seconds: 1),
//                       child: const Text(
//                         "Enter the OTP send on your",
//                         style: TextStyle(
//                             color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
//                       )),
//                   FadeInUp(
//                       duration: const Duration(seconds: 1),
//                       child: Text(
//                         "Phone No. : ${controller.phoneNumberController.value.text} ",
//                         style: TextStyle(
//                             color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
//                       )),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   FadeInUp(
//                     duration: const Duration(seconds: 1),
//                     child: Center(
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 20, right: 20, top: 5),
//                         child: Pinput(
//                           focusNode: controller.focusNode.value,
//                           androidSmsAutofillMethod:
//                               AndroidSmsAutofillMethod.smsUserConsentApi,
//                           listenForMultipleSmsOnAndroid: true,
//                           defaultPinTheme: defaultPinTheme,
//                           length: 6,
//                           onChanged: (value) {
//                             controller.code.value = value;
//                           },
//                           hapticFeedbackType: HapticFeedbackType.lightImpact,
//                           onCompleted: (pin) {
//                             debugPrint('onCompleted: $pin');
//                           },
//                           cursor: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Container(
//                                 margin: const EdgeInsets.only(bottom: 9),
//                                 width: 22,
//                                 height: 1,
//                                 color: focusedBorderColor,
//                               ),
//                             ],
//                           ),
//                           focusedPinTheme: defaultPinTheme.copyWith(
//                             decoration: defaultPinTheme.decoration!.copyWith(
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(color: focusedBorderColor),
//                             ),
//                           ),
//                           submittedPinTheme: defaultPinTheme.copyWith(
//                             decoration: defaultPinTheme.decoration!.copyWith(
//                               color: fillColor,
//                               borderRadius: BorderRadius.circular(19),
//                               border: Border.all(color: focusedBorderColor),
//                             ),
//                           ),
//                           errorPinTheme: defaultPinTheme.copyBorderWith(
//                             border: Border.all(color: Colors.redAccent),
//                           ),

//                           ///////////////////
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 35.0),
//                     child: FadeInUp(
//                       duration: const Duration(seconds: 1),
//                       child: Container(
//                         height: 45,
//                         width: 180,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             signin();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color.fromARGB(255, 192, 255, 156),
//                             side: const BorderSide(
//                                 color: Color.fromARGB(255, 28, 89, 0)),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Verify OTP",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   FadeInUp(
//                       duration: const Duration(seconds: 1),
//                       child: const Text(
//                         "Didn't recive code?",
//                         style: TextStyle(
//                             color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
//                       )),
//                   FadeInUp(
//                       duration: const Duration(seconds: 1),
//                       child: Text(
//                         "Resend",
//                         style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           color: Color.fromRGBO(0, 0, 0, 1),
//                           fontSize: 14,
//                         ),
//                       )),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   User? user = FirebaseAuth.instance.currentUser;

//   Future<void> signin() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: controller.verifyId.value,
//       smsCode: controller.code.value,
//     );

//     try {
//       await FirebaseAuth.instance
//           .signInWithCredential(credential)
//           .then((value) {
//         Get.offAll(Wrapper());
//       });
//     } on FirebaseAuthException catch (e) {
//       Get.snackbar("Error Occurred", e.code);
//     } catch (e) {
//       Get.snackbar("Error Occurred", e.toString());
//     }
//   }
// }
