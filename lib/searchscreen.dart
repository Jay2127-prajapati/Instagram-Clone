import 'package:flutter/material.dart';
import 'package:insta/nav%20bar/Bottom_nav_bar.dart';

class Searchscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text('Welcome to the Search Screen'),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
