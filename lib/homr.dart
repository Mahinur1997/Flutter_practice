import 'package:bottom_navigation/pages/about.dart';
import 'package:bottom_navigation/pages/details.dart';
import 'package:bottom_navigation/pages/profile.dart';
import 'package:bottom_navigation/pages/setting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Je koyta page nibo tar jonno list neya lagche
  List<Widget> pages = [
    AboutPage(),
    DetailsPage(),
    SettingPage(),
    ProfilePage(),
  ];
  // r akta int variable neya lagbe
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Curved Navigation Nav Bar"),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Icons.person,
            size: 30.0,
          ),
          Icon(
            Icons.details,
            size: 30.0,
          ),
          Icon(
            Icons.settings,
            size: 30.0,
          ),
          Icon(
            Icons.home,
            size: 30.0,
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
