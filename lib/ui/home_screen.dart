import 'package:flutter/material.dart';
import 'package:whatsapp/ui/chats_screen.dart';
import 'package:whatsapp/ui/updates_screen.dart';
import 'package:whatsapp/ui/community_screen.dart';
import 'package:whatsapp/ui/calls_screen.dart';

class WhatsAppHomeScreen extends StatefulWidget {
  const WhatsAppHomeScreen({super.key});

  @override
  State<WhatsAppHomeScreen> createState() => _WhatsAppHomeScreenState();
}

class _WhatsAppHomeScreenState extends State<WhatsAppHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    ChatListScreen(),
    const UpdatesScreen(),
    const CommunityScreen(),
    const CallsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
