import 'package:ama_meet/widgets/home_btn_widget.dart';
import 'package:flutter/material.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeBtnWidget(
                onPressedFunction: (() {}),
                btnText: 'New Meeting',
                btnIcon: Icons.videocam,
              ),
              HomeBtnWidget(
                onPressedFunction: (() {}),
                btnText: 'Join Meeting',
                btnIcon: Icons.add_box_rounded,
              ),
              HomeBtnWidget(
                onPressedFunction: (() {}),
                btnText: 'Shedule',
                btnIcon: Icons.calendar_today,
              ),
              HomeBtnWidget(
                onPressedFunction: (() {}),
                btnText: 'Share Screen',
                btnIcon: Icons.arrow_upward_rounded,
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Create or join the meeting',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
          ),
        ],
      );
  }
}