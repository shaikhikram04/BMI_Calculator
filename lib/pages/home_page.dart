import 'package:flutter/material.dart';
import 'package:my_flutter_apps/pages/result_page.dart';
import 'package:my_flutter_apps/widgets/bottom_button.dart';
import 'package:my_flutter_apps/widgets/card_content.dart';
import 'package:my_flutter_apps/widgets/card.dart';
import 'package:my_flutter_apps/widgets/get_incdec_button.dart';
import 'package:my_flutter_apps/ui_helper/color_util.dart';
import 'package:my_flutter_apps/ui_helper/text_util.dart';

class BMIHomePage extends StatefulWidget {
  const BMIHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _BMIHomeState();
}

class _BMIHomeState extends State<BMIHomePage> {
  int height = 170;
  int weight = 60;
  int age = 20;

  List<bool> genderSelection = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Center(
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
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildCard(
                  onPressed: () {
                    setState(() {
                      genderSelection[0] = true;
                      genderSelection[1] = false;
                    });
                  },
                  color: (genderSelection[0]) ? activeColor : inactiveColor,
                  cardChild: const GenderCard(
                    icon: Icons.male_sharp,
                    label: 'Male',
                  ),
                ),
                BuildCard(
                  onPressed: () {
                    setState(() {
                      genderSelection[0] = false;
                      genderSelection[1] = true;
                    });
                  },
                  color: (genderSelection[1]) ? activeColor : inactiveColor,
                  cardChild: const GenderCard(
                    icon: Icons.female_sharp,
                    label: 'Female',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 395,
            height: 220,
            child: Card(
              color: inactiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: mText23(FontWeight.w300)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$height',
                        style: mTextWhite(50),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'cm',
                        style: mText23(FontWeight.w300),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 0,
                    max: 300,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.white70,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildCard(
                onPressed: () {},
                color: inactiveColor,
                cardChild: WACard(
                  value: weight,
                  label: 'Weight',
                  buttons: GetIncDecButton(
                    onPressedPlus: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onPressedMinus: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
              ),
              BuildCard(
                onPressed: () {},
                color: inactiveColor,
                cardChild: WACard(
                  value: age,
                  label: 'Age',
                  buttons: GetIncDecButton(
                    onPressedPlus: () {
                      setState(() {
                        age++;
                      });
                    },
                    onPressedMinus: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          BottomButton(
            onPressed: () {
              if (genderSelection[0] == false && genderSelection[1] == false)  {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: const Text('Please Select Gender.', style: TextStyle(fontSize: 21),),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text('Close', style: TextStyle(fontSize: 15),))
                    ],
                  );
                },);
              }
              else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        height: height,
                        weight: weight,
                        age: age,
                        genderSelection: genderSelection,
                      ),
                    ));
              }
            },
            text: 'Calculate',
          ),
        ],
      ),
    );
  }
}
