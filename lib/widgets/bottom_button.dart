import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BottomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        minimumSize: const Size(410, 80),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 35),
      ),
    );
  }
}
