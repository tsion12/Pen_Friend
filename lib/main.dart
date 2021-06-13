import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
    // introducing the theme colors.
    primaryColor: Color(0xff6D4C41),
    accentColor: Color(0xffFF9E80),
    // introducing the default font family.
    fontFamily: 'Georgia',
    // introducing the default TextTheme.
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Georgia'),
    ),
  ),
    home: Scaffold(
      body: MyApp()),
    ),

  );
    
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      //feel free to remove
      child: Center(
        child: Text('   የብዕር ጓደኛ \n let\'s get started!',
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 35,
          fontFamily: 'DancingScript-Bold',
        ),
        ),
      ),
    );
  }
}