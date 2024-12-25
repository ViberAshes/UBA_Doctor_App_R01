import 'package:doctor_r01/onbording/onboading_model.dart';
import 'package:flutter/material.dart';

class Onbording_View extends StatelessWidget {
  const Onbording_View({
    super.key,
    required this.model,
  });

  final OnbordingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.bgcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 25),
              child: Image.asset(
                model.image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
              )),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10,
                  left: 15,
                ),
                child: Text(
                  model.title,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 64, 7, 79)),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 7, left: 15.0, right: 15),
                  child: Text(
                    model.subtitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 67, 6, 71),
                    ),
                    textAlign: TextAlign.center,
                  )),
              // Text(
              //   model.counterText,
              //   style: TextStyle(
              //       fontSize: 15,
              //       color: Colors.black,
              //       fontWeight: FontWeight.w400),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
