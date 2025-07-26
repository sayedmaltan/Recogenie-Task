import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomFullButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double ?radios;

  const CustomFullButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
     this.radios,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radios ?? 30),
      ),
      minWidth: double.infinity,
      color: const Color.fromARGB(255, 0, 0, 0),
      onPressed: onPressed,
      child: Text(text, style: Styles.textStyleFullButton),
    );
  }
}
