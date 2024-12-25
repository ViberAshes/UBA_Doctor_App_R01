import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import 'onboading_model.dart';
import 'onbording_widget.dart';

class OnboardingController extends GetxController {
  var controller = LiquidController();
  var currentPage = 0.obs;

  final pages = [
    Onbording_View(
      model: OnbordingModel(
        image: 'assets/images/welcome_onbord_img_1.png',
        title: "Welcome to HealthSync",
        subtitle:
            "where your helth journey begins with seamless connectivity, personalized care, and convenient access to all your medical needs.",
        subtitletow: "TitleTitleTitleTitleTitleTitle",
        counterText: "1/4",
        bgcolor: Color(0xffCBE4F9),
      ),
    ),
    Onbording_View(
      model: OnbordingModel(
        image: 'assets/images/onboard_doctor_img_2.png',
        title: "Medicinal",
        subtitle:
            "Emporing paitents with personilised health insight and seamless communication with healthcare providers, all in one place.",
        subtitletow: "TitleTitleTitleTitleTitleTitle",
        counterText: "2/4",
        bgcolor: Color(0xFFEFF9DA),
      ),
    ),
    Onbording_View(
      model: OnbordingModel(
        image: 'assets/images/onboard_doctor_img_3.png',
        title: "Paitent App",
        subtitle:
            "Take Control of your health journey effortlessly, wiith easy access to medical records, appointment scheduleing, and health tracking features.",
        subtitletow: "TitleTitleTitleTitleTitleTitle",
        counterText: "3/4",
        bgcolor: Color(0xFFF9D8D6),
      ),
    ),
    Onbording_View(
      model: OnbordingModel(
        image: 'assets/images/onboard_doctor_img_4.png',
        title: "Pharmacy App",
        subtitle:
            "Your one-step solution for managing prescription, ordering medication, and staying informed about health tips and reminders, tailored just for you.",
        subtitletow: "TitleTitleTitleTitleTitleTitle",
        counterText: "4/4",
        bgcolor: Color(0xFFD6CDEA),
      ),
    ),
  ];

  onPageChangeChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  var nextPage = 0.obs;
  skip() => controller.jumpToPage(page: pages.length - 1);
  animateToNextSlide() {
    nextPage.value = controller.currentPage + 1;
    controller.animateToPage(page: nextPage.value);
  }

  animateToPreviousSlide() {
    nextPage.value = controller.currentPage - 1;
    controller.animateToPage(page: nextPage.value);
  }

  @override
  void onInit() {
    controller = LiquidController();
    super.onInit();
  }
}
