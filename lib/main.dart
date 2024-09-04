import 'package:badminton/modules/coach_module/coach_home/views/coach_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "Poppins"),
      home: const CoachHomeScreen(),
    );
  }
}
