import 'package:ama_meet/widgets/home_btn_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),

      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),

      body: Column(
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
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        // unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank
            ),
            label: 'Meet&Chat'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock
            ),
            label: 'Meetings'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline
            ),
            label: 'Contacts'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined
            ),
            label: 'Settings'
          ),
        ],
      ),
    );
  }
}