// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// import 'controller.dart';

// class loginView extends GetView<loginViewController> {
//   loginView({Key? key}) : super(key: key);

//   final controller = Get.put(loginViewController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
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
//                 padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     FadeInUp(
//                         duration: const Duration(milliseconds: 1500),
//                         child: const Text(
//                           "Login",
//                           style: TextStyle(
//                               color: Color.fromRGBO(122, 41, 168, 0.97),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 18.0),
//                       child: FadeInUp(
//                           duration: const Duration(milliseconds: 1700),
//                           child: Container(
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
//                                     Container(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 10),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.grey),
//                                         borderRadius: BorderRadius.circular(5),
//                                       ),
//                                       child: DropdownButton<String>(
//                                         value: controller.,
//                                         onChanged: (newValue) {
//                                             countryCode = newValue.toString();
//                                         },
//                                         items: <String>[
//                                           '+1',
//                                           '+91',
//                                           '+44',
//                                           '+81'
//                                         ] // Add more country codes as needed
//                                             .map<DropdownMenuItem<String>>(
//                                                 (String value) {
//                                           return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Text(value),
//                                           );
//                                         }).toList(),
//                                       ),
//                                     ),
//                                     SizedBox(width: 10),
//                                     Expanded(
//                                       child: TextField(
//                                         controller: phoneNumberController,
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
//                                 Container(
//                                   padding: const EdgeInsets.all(10),
//                                   decoration: const BoxDecoration(
//                                       border: Border(
//                                           bottom: BorderSide(
//                                               color: Color.fromRGBO(
//                                                   196, 135, 198, .3)))),
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: "Username",
//                                         hintStyle: TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.grey.shade700)),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.all(10),
//                                   child: TextField(
//                                     obscureText: true,
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: "Password",
//                                         hintStyle: TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.grey.shade700)),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15.0, left: 4),
//                       child: FadeInUp(
//                           duration: const Duration(milliseconds: 1700),
//                           child: GestureDetector(
//                             child: Text(
//                               "Forgot Password?",
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 color: Color.fromRGBO(196, 135, 198, 1),
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
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     Color.fromARGB(255, 84, 177, 174),
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
//                                   "Create Account",
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
