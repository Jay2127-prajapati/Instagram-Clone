import 'package:flutter/material.dart';
import 'package:insta/homescreen.dart';
import 'package:insta/profilepage.dart';
import 'package:insta/reelsscreen.dart';
import 'package:insta/searchscreen.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Homepage(),
    Searchscreen(),
    Reelsscreen(),
    Profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],  // Display the selected screen
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildNavBarItem(icon: Icons.home, index: 0),
            buildNavBarItem(icon: Icons.search, index: 1),
            buildNavBarItem(icon: Icons.video_collection, index: 2),
            buildNavBarItem(icon: Icons.person, index: 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem({required IconData icon, required int index}) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Icon(
          icon,
          size: 30,  // Set the size of the icons
          color: _selectedIndex == index ? Colors.green : Colors.white70,
        ),
      ),
    );
  }
}
