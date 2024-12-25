import 'package:animate_do/animate_do.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:doctor_r01/doctor_profile_setup/doctor_input_controller.dart';
import 'package:doctor_r01/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../doctor_profile_setup/user.dart';
import 'signupa_controller.dart';

class SignUpView extends StatelessWidget {
  final controller = Get.put(SignupController());
  final doctorInputController = Get.put(DoctorInputController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              child: SingleChildScrollView(
            child: Column(
              children: [
                if (controller.phoneEntryView.value)
                  PhoneEnteryView(context)
                else if (controller.otpEntryView.value)
                  OTPVerifyView(context)
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget PhoneEnteryView(BuildContext context) {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.pink.shade50,
              Colors.tealAccent.shade400,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/hospital.png',
                            ),
                            fit: BoxFit.cover)),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 15, right: 15, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: const Text(
                          " Signup ",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        196, 135, 198, .3)),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Color.fromRGBO(196, 135, 198, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  )
                                ]),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    CountryCodePicker(
                                      onChanged: print,
                                      initialSelection: 'IN',
                                      favorite: ['+91'],
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      alignLeft: false,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: TextField(
                                        controller: controller
                                            .phoneNumberController.value,
                                        decoration: InputDecoration(
                                          labelText: 'Phone Number',
                                          prefixIcon: Icon(Icons.phone),
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.phone,
                                      ),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   padding: const EdgeInsets.all(10),
                                //   child: TextField(
                                //     obscureText: true,
                                //     decoration: InputDecoration(
                                //         border: InputBorder.none,
                                //         hintText: "Password",
                                //         hintStyle: TextStyle(
                                //             fontSize: 14,
                                //             color: Colors.grey.shade700)),
                                //   ),
                                // )
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 4),
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: GestureDetector(
                            child: const Text(
                              'Existing user?',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1900),
                        child: Container(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.to(() => OTPAuthScreen());

                              if (controller
                                  .phoneNumberController.value.text.isEmpty) {
                                if (!Get.isSnackbarOpen) {
                                  Get.snackbar('Empty Phone Field',
                                      "Please enter the phone no.",
                                      backgroundColor: Colors.white);
                                }
                              } else {
                                controller.phoneEntryView.value = false;
                                controller.otpEntryView.value = true;

                                controller.sendcode();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent.shade200,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 2000),
                        child: Center(
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Signup with Truecaller",
                                  style: TextStyle(
                                      color: Color.fromRGBO(49, 39, 79, .6)),
                                )))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget OTPVerifyView(BuildContext context) {
    var focusedBorderColor = Color.fromRGBO(6, 10, 10, 1);
    var fillColor = Color.fromRGBO(243, 246, 249, 0);
    var borderColor = Color.fromRGBO(1, 11, 9, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Color.fromRGBO(32, 21, 21, 1)),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple.shade300,
            Colors.white24,
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/images/verify_otp_doctor.png',
                      ),
                      fit: BoxFit.cover,
                    )),
                  )),
              SizedBox(
                height: 15,
              ),
              FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: const Text(
                    "Phone No. Verification",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )),
              SizedBox(
                height: 15,
              ),
              FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: const Text(
                    "Enter the OTP send on your",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
                  )),
              FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: Text(
                    "Phone No. : ${controller.phoneNumberController.value.text} ",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
                  )),
              SizedBox(
                height: 20,
              ),
              FadeInUp(
                duration: const Duration(seconds: 1),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Pinput(
                      // focusNode: controller.focusNode.value,
                      // androidSmsAutofillMethod:
                      //     AndroidSmsAutofillMethod.smsUserConsentApi,
                      // listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      length: 6,
                      onChanged: (value) {
                        controller.code.value = value;
                      },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),

                      ///////////////////
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: Container(
                    height: 45,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        // controller.otpEntryView.value = false;
                        // controller.registerEntryView.value = true;
                        controller.signin();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 192, 255, 156),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 28, 89, 0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Verify OTP",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: const Text(
                    "Didn't recive code?",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
                  )),
              FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
/* 
  Widget DoctorInputView(BuildContext context) {
    return SingleChildScrollView(
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
              controller: doctorInputController.nameController.value,
              decoration: InputDecoration(
                hintText: 'Enter your full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon:
                    doctorInputController.nameController.value.text.isEmpty
                        ? Icon(Icons.vaccines)
                        : Icon(Icons.add_reaction_rounded),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: doctorInputController.qualificationController.value,
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
              controller: doctorInputController.degreeController.value,
              decoration:
                  doctorInputController.degreeController.value.text.isEmpty
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
              controller: doctorInputController.fieldController.value,
              decoration:
                  doctorInputController.fieldController.value.text.isEmpty
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
              controller: doctorInputController.detailsController.value,
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
                // Create a Doctor object with the input values
                Doctor doctor = Doctor(
                  Uid: controller.phoneNumberController.value.text,
                  name: doctorInputController.nameController.value.text,
                  qualification:
                      doctorInputController.qualificationController.value.text,
                  degree: doctorInputController.degreeController.value.text,
                  field: doctorInputController.fieldController.value.text,
                  details: doctorInputController.detailsController.value.text,
                );

                print(doctor.toString());
                controller.createUser(doctor);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
 */
}
