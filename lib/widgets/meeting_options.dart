import 'package:flutter/material.dart';

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  const MeetingOptions({super.key, required this.text, required this.isMute, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Switch(value: isMute, onChanged: onChanged)
        ],
      ),
    );
  }
}