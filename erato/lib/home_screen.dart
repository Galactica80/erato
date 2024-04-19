import 'dart:math';

import 'package:erato/ChatBOT/chatbot.dart';
import 'package:erato/Hamburger-Menu-Components/drawer.dart';
import 'package:erato/User-Story-Publishing/story_publishing.dart';
import 'package:erato/UserProfile_And_Community/profile_Settings.dart';
import 'package:erato/UserProfile_And_Community/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Search'),
    Text('Index 2: Profile'),
    Text('Index 3: Bookmark'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Get.to(const ProfileSettings());
            },
            label: const Text(""),
            icon: const Icon(Icons.person),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: [
        const ProfilePage(),
        const Center(
          child: Text(
            'search 👨‍🏫',
          ),
        ),
         PublishStoryPage(),
        const Center(
          child: Text(
            'BOOKMARK 🐛',
          ),
        ),
        ChatBot(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.bookOpen),
            label: '',
          ),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.magnifyingGlass), label: ''),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.solidSquarePlus), label: ''),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.solidBookmark), label: ''),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.solidMessage), label: '')
        ],
        selectedIndex: _selectedIndex,
        animationDuration: const Duration(milliseconds: 300),
        indicatorColor: Colors.blueGrey,
      ),
    );
  }
}
