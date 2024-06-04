import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_apps/widgets/rounded_button.dart';

class GetIncDecButton extends StatelessWidget {
  final VoidCallback onPressedPlus;
  final VoidCallback onPressedMinus;

  const GetIncDecButton({
    super.key,
    required this.onPressedPlus,
    required this.onPressedMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedButton(icon: CupertinoIcons.minus, onPressed: onPressedMinus),
        const SizedBox(
          width: 8,
        ),
        RoundedButton(icon: Icons.add, onPressed: onPressedPlus),
      ],
    );
  }
}
