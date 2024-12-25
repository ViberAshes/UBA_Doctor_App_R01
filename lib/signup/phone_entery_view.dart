// import 'package:animate_do/animate_do.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'signupa_controller.dart';

// class PhoneEnteryView extends StatelessWidget {
//   PhoneEnteryView({super.key});
//   final controller = Get.put(SignupController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Colors.pink.shade50,
//               Colors.tealAccent.shade400,
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               FadeInUp(
//                   duration: const Duration(seconds: 1),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 2,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage(
//                               'assets/images/hospital.png',
//                             ),
//                             fit: BoxFit.cover)),
//                   )),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: 20, left: 15, right: 15, top: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     FadeInUp(
//                         duration: const Duration(milliseconds: 1500),
//                         child: const Text(
//                           " Signup ",
//                           style: TextStyle(
//                               color: Color.fromRGBO(0, 0, 0, 1),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 18.0),
//                       child: FadeInUp(
//                           duration: const Duration(milliseconds: 1700),
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white,
//                                 border: Border.all(
//                                     color: const Color.fromRGBO(
//                                         196, 135, 198, .3)),
//                                 boxShadow: [
//                                   const BoxShadow(
//                                     color: Color.fromRGBO(196, 135, 198, .3),
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10),
//                                   )
//                                 ]),
//                             child: Column(
//                               children: <Widget>[
//                                 Row(
//                                   children: [
//                                     CountryCodePicker(
//                                       onChanged: print,
//                                       initialSelection: 'IN',
//                                       favorite: ['+91'],
//                                       showCountryOnly: false,
//                                       showOnlyCountryWhenClosed: false,
//                                       alignLeft: false,
//                                     ),
//                                     SizedBox(width: 10),
//                                     Expanded(
//                                       child: TextField(
//                                         controller: controller
//                                             .phoneNumberController.value,
//                                         decoration: InputDecoration(
//                                           labelText: 'Phone Number',
//                                           prefixIcon: Icon(Icons.phone),
//                                           border: OutlineInputBorder(),
//                                         ),
//                                         keyboardType: TextInputType.phone,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 // Container(
//                                 //   padding: const EdgeInsets.all(10),
//                                 //   child: TextField(
//                                 //     obscureText: true,
//                                 //     decoration: InputDecoration(
//                                 //         border: InputBorder.none,
//                                 //         hintText: "Password",
//                                 //         hintStyle: TextStyle(
//                                 //             fontSize: 14,
//                                 //             color: Colors.grey.shade700)),
//                                 //   ),
//                                 // )
//                               ],
//                             ),
//                           )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0, left: 4),
//                       child: FadeInUp(
//                           duration: const Duration(milliseconds: 1700),
//                           child: GestureDetector(
//                             child: const Text(
//                               'Existing user?',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     FadeInUp(
//                         duration: const Duration(milliseconds: 1900),
//                         child: Container(
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Get.to(() => OTPAuthScreen());
//                               controller.phoneEntryView.value = false;
//                               controller.otpEntryView.value = true;

//                               controller.sendcode();
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.purpleAccent.shade200,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50),
//                                 )),
//                             child: const Center(
//                               child: Text(
//                                 "Login",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         )),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     FadeInUp(
//                         duration: const Duration(milliseconds: 2000),
//                         child: Center(
//                             child: TextButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   "Signup with Truecaller",
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(49, 39, 79, .6)),
//                                 )))),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
