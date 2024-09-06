import 'package:badminton/modules/orientation_module/orientation_home/orientation_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "Poppins"),
      // home: req_success(
      //   image: 'assets/gif/req.gif',
      //   textOne: 'Request Sent',
      //   textTwo: 'Successfully',
      // ),
      home: const OrientationHome(),
    );
  }
}
