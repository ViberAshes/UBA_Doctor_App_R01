import 'package:doctor_r01/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../wrapper/wrapper.dart';
import 'onboarding_controller.dart';

class OnbordingView extends GetView<OnboardingController> {
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            body: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  LiquidSwipe(
                    positionSlideIcon: 0.8,
                    slideIconWidget: const Icon(Icons.arrow_back_ios),
                    fullTransitionValue: 200,
                    enableSideReveal: false,
                    preferDragFromRevealedArea: true,
                    ignoreUserGestureWhileAnimating: true,
                    enableLoop: false,
                    liquidController: controller.controller,
                    onPageChangeCallback:
                        controller.onPageChangeChangedCallback,
                    waveType: WaveType.liquidReveal,
                    pages: controller.pages,
                  ),
                  Visibility(
                    visible: controller.currentPage.value !=
                        controller.pages.length - 1,
                    child: Positioned(
                        top: 20,
                        right: 20,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.skip();
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black38,
                              side: const BorderSide(color: Colors.black26)),
                          child: const Row(
                            children: [
                              Text(
                                "Skip",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.skip_next_rounded),
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 25,
                    child: Row(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              controller.animateToPreviousSlide();
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.black26),
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(5)),
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: const BoxDecoration(
                                  color: Color(0xff272727),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.arrow_back_rounded,
                                  size:
                                      MediaQuery.of(context).size.height / 25),
                            )),

                        ///////////////////////////////////////////////
                        Visibility(
                          visible: controller.currentPage.value !=
                              controller.pages.length - 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedSmoothIndicator(
                              activeIndex: controller.currentPage.value,
                              count: controller.pages.length,
                              effect: const WormEffect(
                                  strokeWidth: 50,
                                  dotWidth: 20,
                                  dotColor: Color.fromARGB(75, 199, 58, 182),
                                  spacing: 10,
                                  activeDotColor:
                                      Color.fromARGB(255, 199, 58, 183),
                                  dotHeight: 20),
                            ),
                          ),
                        ),
                        ///////////////////////////////////////////////
                        Visibility(
                          replacement: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 45,
                              width: 180,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(Wrapper());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffCBE4F9),
                                  side: const BorderSide(color: Colors.black),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Continue",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.last_page,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          visible: controller.currentPage.value !=
                              controller.pages.length - 1,
                          child: OutlinedButton(
                              onPressed: () {
                                controller.animateToNextSlide();
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.black26),
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5)),
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: const BoxDecoration(
                                    color: Color(0xff272727),
                                    shape: BoxShape.circle),
                                child: Icon(Icons.arrow_forward_rounded,
                                    size: MediaQuery.of(context).size.height /
                                        25),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
