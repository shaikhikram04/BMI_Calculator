import 'package:flutter/material.dart';
import '../ui_helper/text_util.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const GenderCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 120,
        ),
        Text(
          label,
          style: mText23(FontWeight.w300),
        ),
      ],
    );
  }
}

class WACard extends StatelessWidget {
  final String label;
  final int value;
  final Widget buttons;

  const WACard(
      {super.key,
      required this.label,
      required this.value,
      required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: mText23(FontWeight.w300),
        ),
        Text(
          '$value',
          style: mTextWhite(50),
        ),
        buttons,
      ],
    );
  }
}
