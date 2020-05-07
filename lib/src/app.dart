import 'package:flutter/material.dart';
import 'package:simplefluttertodoapp/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
