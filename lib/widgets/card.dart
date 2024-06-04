import 'package:flutter/cupertino.dart';

class BuildCard extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget cardChild;

  const BuildCard({
    super.key,
    required this.onPressed,
    required this.color,
    required this.cardChild,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
