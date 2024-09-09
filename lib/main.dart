import 'package:badminton/modules/orientation_module/orientation_home/orientation_home_screen.dart';
import 'package:badminton/modules/orientation_module/orientation_request_lists/views/requester_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const RequesterList(),
      // theme: ThemeData.dark(),
      // initialRoute: '/PlayerDashboard',
      // routes: {
      //   '/PlayerDashboard': (context) => const PlayerDashboard(),
      //   '/RAKPodiumScreen': (context) =>  const RakPodium(),
      //   '/CurriculumPage': (context) =>  const CurriculumPage(),
      //   '/SkillAssessment': (context) =>  const SkillAssessment(),
      //   '/WellnessScreen': (context) => const WellnessScreen(),
      // },
    );
  }
}
