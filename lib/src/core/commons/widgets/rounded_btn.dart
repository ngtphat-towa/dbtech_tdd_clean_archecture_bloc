import 'package:dbtech_tdd_clean_archecture_bloc/src/core/commons/resources/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.buttonColor,
    this.labelColor,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? labelColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? Colours.primaryColour,
        foregroundColor: labelColor ?? Colors.white,
        minimumSize: const Size(double.maxFinite, 50),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
