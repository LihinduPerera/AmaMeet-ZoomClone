import 'package:ama_meet/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressedFunction;
  const CustomBtn({super.key, required this.text , required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: onPressedFunction,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: buttonColor,
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text(text, style: TextStyle(fontSize: 17))
      ),
    );
  }
}