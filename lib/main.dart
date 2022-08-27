import 'package:flutter/material.dart';
import 'package:flutter_form/screens/home_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ลงทะเบียน',
      home: HomeScreen(),
    );
  }
}
