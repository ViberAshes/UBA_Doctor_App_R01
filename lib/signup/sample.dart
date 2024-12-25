// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   String countryCode = '+1'; // Default country code
//   TextEditingController phoneNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: DropdownButton<String>(
//                     value: countryCode,
//                     onChanged: (newValue) {
//                       setState(() {
//                         countryCode = newValue.toString();
//                       });
//                     },
//                     items: <String>[
//                       '+1',
//                       '+91',
//                       '+44',
//                       '+81'
//                     ] // Add more country codes as needed
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     controller: phoneNumberController,
//                     decoration: InputDecoration(
//                       labelText: 'Phone Number',
//                       prefixIcon: Icon(Icons.phone),
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.phone,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 String phoneNumber =
//                     countryCode + phoneNumberController.text.trim();
//                 // Implement verification logic here
//                 print('Verifying phone number: $phoneNumber');
//               },
//               child: Text('Verify'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: SignUpPage(),
//   ));
// }
