import 'package:badminton/modules/authentication/signin_module/splash_scrn.dart';
import 'package:badminton/modules/orientation_module/orientation_home/orientation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData(fontFamily: "Poppins"),
        home: const OrientationHome());
  }
}
