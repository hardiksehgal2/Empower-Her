import 'package:flutter/material.dart';
import 'package:women_saftey/child/bottom_screens/add_contacts.dart';
import 'package:women_saftey/child/bottom_screens/chat_page.dart';
import 'package:women_saftey/child/bottom_screens/contacts_page.dart';
import 'package:women_saftey/child/bottom_screens/profile_page.dart';
import 'package:women_saftey/child/bottom_screens/review_page.dart';

import 'bottom_screens/home_screen.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    AddContactsPage(),
    ChatPage(),
    ProfilePage(),
    ReviewPage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Contacts',
            icon: Icon(Icons.contacts),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Review',
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
