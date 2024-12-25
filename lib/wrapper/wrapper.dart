import 'package:doctor_r01/navbar/navi.dart';
import 'package:doctor_r01/signup/signupa_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../doctor_profile_setup/doctor_input_view.dart';
import '../signup/signup_view.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});
  final SignupController signupController = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavBar();
          } else {
            return SignUpView();
          }
        },
      ),
    );
  }
}
