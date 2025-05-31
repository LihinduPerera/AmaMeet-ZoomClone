import 'dart:math';

import 'package:ama_meet/resources/jitsi_meet_methods.dart';
import 'package:ama_meet/widgets/home_btn_widget.dart';
import 'package:flutter/material.dart';

class MeetingPage extends StatelessWidget {
  MeetingPage({super.key});

  final JitsiMeetMethods _jmm = JitsiMeetMethods();

  createNewMeeting() async {

    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();

    _jmm.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-meeting');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeBtnWidget(
                onPressedFunction: createNewMeeting,
                btnText: 'New Meeting',
                btnIcon: Icons.videocam,
              ),
              HomeBtnWidget(
                onPressedFunction: () => joinMeeting(context) ,
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