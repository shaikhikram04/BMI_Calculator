import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_apps/ui_helper/text_util.dart';
import 'package:my_flutter_apps/widgets/bottom_button.dart';
import '../ui_helper/color_util.dart';


double calculateBMI(int height, int weight) {
  return (weight/pow(height/100.0, 2.0));
}

class StatusMessage {
  String status;
  String message;
  final Color color;

  StatusMessage(this.status, this.message, this.color);
}

StatusMessage getStatusMsg(double bmiVal) {
  if (bmiVal < 18.5) {
    return StatusMessage('Underweight', 'Your weight is below the healthy range. Consider seeking advice for a balanced diet.', CupertinoColors.activeBlue);
  } else if (bmiVal < 25.0) {
    return StatusMessage('Normal', 'You have a normal body weight. Good job!', CupertinoColors.activeGreen);
  } else if (bmiVal < 30.0) {
    return StatusMessage('Overweight', 'Your weight is above the healthy range. Small changes can lead to a healthier weight.', Colors.yellowAccent);
  } else {
    return StatusMessage('Obese', 'Your weight is a concern. Take steps towards a healthier lifestyle.', Colors.red);
  }
}




class ResultPage extends StatelessWidget {

  final int height;
  final int weight;
  final int age;
  final List<bool> genderSelection;

  const ResultPage({super.key, required this.height, required this.weight, required this.age, required this.genderSelection});

  @override
  Widget build(BuildContext context) {
    double bmiValue = calculateBMI(height, weight);
    StatusMessage statusMessage = getStatusMsg(bmiValue);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: themeColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'BMI Calculator',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      backgroundColor: themeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Your Result',
              style: mTextWhite(50),
            ),
          ),
          SizedBox(
            width: 395,
            height: 500,
            child: Card(
              color: inactiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    statusMessage.status,
                    style: TextStyle(
                      color: statusMessage.color,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(bmiValue.toStringAsFixed(1), style: mTextWhite(90)),
                  Text(
                    statusMessage.message,
                    style: mText23(FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}
