import 'package:ama_meet/pages/meeting_history_page.dart';
import 'package:ama_meet/pages/meeting_page.dart';
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

  List<Widget> pages = [
    const MeetingPage(),
    const MeetingHistoryPage(),
    Text('Contacts'),
    Text('Settings')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),

      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),

      body: pages[_page],
      
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