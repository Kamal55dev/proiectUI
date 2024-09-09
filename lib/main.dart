import 'package:badminton/screens/RAK_curriculum/RKM_Curriculum.dart';
import 'package:badminton/screens/Wellness.dart';
import 'package:badminton/screens/player_dashbord.dart';
import 'package:badminton/screens/rak_podium.dart';
import 'package:badminton/screens/skill_assessment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'modules/authentication/signin_module/splash_scrn.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/PlayerDashboard',
      routes: {
        '/PlayerDashboard': (context) => const PlayerDashboard(),
        '/RAKPodiumScreen': (context) => const RakPodium(),
        '/CurriculumPage': (context) => const CurriculumPage(),
        '/SkillAssessment': (context) => const SkillAssessment(),
        '/WellnessScreen': (context) => const WellnessScreen(),
      },
    );
  }
}
