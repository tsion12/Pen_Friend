import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'timeline_screen.dart';
import 'bottom_nav.dart';
import 'signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0XFF6D4C41),
        accentColor: Color(0XFFFF9E80),
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        'main': (context) => BottomNav(),
        'timeline': (context) => Timeline(),
        'search': (context) => SearchPage(),
        'profile': (context) => ProfilePage(),
        'signup': (context) => Signup(),
        'login': (context) => Login()
      },
    );
  }
}
