// import 'package:animate_do/animate_do.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class OTPAuthScreen extends StatelessWidget {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _verifyPhoneNumber() async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: _phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//         Get.offAll(HomeScreen());
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print('Error: ${e.message}');
//         Get.snackbar('Error', 'Failed to verify phone number');
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         Get.to(OTPVerificationScreen(verificationId));
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Authentication'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: 'Enter Phone Number',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _verifyPhoneNumber();
//               },
//               child: Text('Send OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OTPVerificationScreen extends StatelessWidget {
//   final String verificationId;

//   OTPVerificationScreen(this.verificationId);

//   final TextEditingController _otpController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _signInWithPhoneNumber(String otp) async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: otp,
//     );

//     try {
//       await _auth.signInWithCredential(credential);
//       Get.offAll(HomeScreen());
//     } catch (e) {
//       print('Error: $e');
//       Get.snackbar('Error', 'Failed to sign in with OTP');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'Enter OTP',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _signInWithPhoneNumber(_otpController.text);
//               },
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('Authenticated Successfully!'),
//       ),
//     );
//   }
// }
