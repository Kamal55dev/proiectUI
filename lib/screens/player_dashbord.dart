
import 'package:badminton/screens/Wellness.dart';
import 'package:badminton/screens/rak_podium.dart';
import 'package:badminton/screens/skill_assessment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/provider/dashbord_provider.dart';
import 'RAK_curriculum/RKM_Curriculum.dart';

class PlayerDashboard extends ConsumerWidget {
  // ignore: use_super_parameters
  const PlayerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerName = ref.watch(playerNameProvider);
    final playerLevel = ref.watch(playerLevelProvider);
    final playerLocation = ref.watch(playerLocationProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1B1C1E), // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Player', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 90,
                  width: 350,
                   margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(16),
                   decoration: BoxDecoration(
                     color: const Color(0xFF2A2A2D),
                    borderRadius: BorderRadius.circular(10),
                 ),
                 child: Row(
                  children: [
                    const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/Ellipse 100.png'), // Placeholder image
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Text(playerName, style: const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(playerLevel, style: const TextStyle(color: Colors.purpleAccent)),
                    const SizedBox(width: 110),
                    const Icon(Icons.location_on_outlined,size: 13,),
                    Text(playerLocation, style: const TextStyle(color: Colors.white54)),
                      ],
                    )
                    
                  ],
                ),
                  ],
                 ),
                ),
                
              ],
            ),
            const SizedBox(height: 20),
            _buildRAKCurriculumSection(context),
            const SizedBox(height: 20),
            _buildRAKPodiumSection(context), // Updated
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 40),
            _buildWellnessAttendanceSection(context), // Updated
            const SizedBox(height: 40),
            _buildSkillAssessmentSection(context), // Updated
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 30,),
            _buildRecentMatchesSection(context),

          ],
        ),
      ),
    );
  }

  Widget _buildRAKCurriculumSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,  // Adjust height as needed
          width: 470,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/Subtract.png'),  // Replace with your image path
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),  // Rounded corners
          ),
        ),
        const Positioned(
          left: 200,
          top: 90,
          child: Text(
            'RAK Curriculum',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: 200,
          bottom: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurriculumPage(),
                    ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB08900),  // Updated button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),  // Rounded button
              ),
            ),
            child: const Row(
              children: [
                Text('Start Program'),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16), // Arrow icon inside the button
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRAKPodiumSection(BuildContext context) {
    return Stack(
      children: [
        // Flash effect
        Positioned(
          right: 0,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.orange.withOpacity(0.30),
                  Colors.transparent,
                ],
                stops: const [0.5, 1],
              ),
            ),
          ),
        ),
        // Content
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'RAK Podium',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RakPodium(),
                    ),
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB08900), // Updated button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text('Start Scoring'),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16), // Arrow icon inside the button
                    ],
                  ),
                ),
              ],
            ),
            // Trophy image above flash
            Image.asset(
              'assets/images/trophy-dynamic-premium.png',  // Replace with your image path
              height: 145,
              width: 145,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillAssessmentSection(BuildContext context) {
    return Stack(
      children: [
        // Flash effect
        Positioned(
          right: 0,
          child: Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.orange.withOpacity(0.30),
                  Colors.transparent,
                ],
                stops: const [0.5, 1],
              ),
            ),
          ),
        ),
        // Content
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Skill\nAssessment',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SkillAssessment(),
                    ),
                  );          
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB08900), // Updated button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text('Start Grading'),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16), // Arrow icon inside the button
                    ],
                  ),
                ),
              ],
            ),
            // Skill assessment image above flash
            Image.asset(
              'assets/images/file-fav-dynamic-premium.png',  // Replace with your image path
              height: 145,
              width: 145,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWellnessAttendanceSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildWellnessCard(context),
        _buildAttendanceCard(),
      ],
    );
  }

    Widget _buildWellnessCard(BuildContext context) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        // Navigate to the Wellness page when the card is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WellnessScreen()),
        );
      },
      child: Container(
        height: 175,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFC107)),
                ),
                child: const Text(
                  'Today',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    value: 1,
                    strokeWidth: 5,
                    backgroundColor: Colors.grey[800],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                ),
                const Text(
                  '--%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            const Text('Wellness', style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildAttendanceCard() {
    return Expanded(
      child: Container(
        height: 175,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFC107)),
                ),
                child: const Text(
                  'This Month',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '00',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const Text('Days', style: TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 16),
            const Text('Attendance', style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }
}

Widget _buildRecentMatchesSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Recent Matches',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text(
                  '24 Jun 2024',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                SizedBox(width: 8),
                Icon(Icons.access_time, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text(
                  '10:30 AM',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                Spacer(),
                Text(
                  'Tournament',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/Ellipse 100.png'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jessie Doe Stephen Li',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'vs',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Opponent',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      children: [],
                    ),
                    Text(
                      '21 18 21',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '04 21 12',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // You can add more containers like this for additional matches.
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text(
                  '24 Jun 2024',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                SizedBox(width: 8),
                Icon(Icons.access_time, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text(
                  '10:30 AM',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                Spacer(),
                Text(
                  'Tournament',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/Ellipse 100.png'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jessie Doe Stephen Li',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'vs',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Opponent',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      children: [],
                    ),
                    Text(
                      '21 18 21',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '04 21 12',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
