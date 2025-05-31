import 'package:ama_meet/resources/auth_methods.dart';
import 'package:ama_meet/resources/jitsi_meet_methods.dart';
import 'package:ama_meet/widgets/meeting_options.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key});

  @override 
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  final AuthMethods _authMethods = AuthMethods();

  final JitsiMeetMethods _jjm = JitsiMeetMethods();

  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners(); 
  }

  _joinMeeting() {
    _jjm.createMeeting(roomName: meetingIdController.text, isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted, userName: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: backgroundColor,
        title: Text(
          'Join Meeting',
          style: TextStyle(
            fontSize: 18
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: Colors.grey,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room ID',
              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            ),
          ),
          TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: Colors.grey,
              filled: true,
              border: InputBorder.none,
              hintText: 'Name',
              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text('Join', style: TextStyle(
                fontSize: 16,
              )),
            ),
          ),
          SizedBox(height: 20,),
          MeetingOptions(text: "Mute audio", isMute: isAudioMuted , onChanged: onAudioMuted,),
          MeetingOptions(text: "Mute video", isMute: isVideoMuted , onChanged: onVideoMuted,),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}