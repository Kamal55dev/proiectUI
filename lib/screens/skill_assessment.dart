import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/provider/Skill_assessment.dart';
import '../modules/player_models/skill_assessment_models.dart';

class SkillAssessment extends ConsumerWidget {
  const SkillAssessment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(SkillAssessmentProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1D21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1D21),
        elevation: 0,
        leading: IconButton(
          onPressed:(){

          } , 
          icon:const Icon(Icons.arrow_back), 
          ) ,
        title: const Text('Assessment', style: TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.menu),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),

            const SizedBox(height: 20),

            

            const SizedBox(height: 20),

            _buildSkillAssessmentSection(context),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  _buildSectionHeader('This Month', 'Take New'),
                  for (var subject in subjects.where((s) => s.status == 'This Month'))
                    _buildCurriculumItem(subject),
                  _buildSectionHeader('August 2024', ''),
                  for (var subject in subjects.where((s) => s.status == 'August 2024'))
                    _buildCurriculumItem(subject),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF292B2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/Ellipse 100.png'),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lee Chong Wei',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  _buildTag('Advance'),
                  const SizedBox(width: 130),
                  _buildLocationTag(Icons.location_on, 'Kuala Lumpur'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF9254FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildLocationTag(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (action.isNotEmpty)
            Text(
              action,
              style: const TextStyle(color: Color.fromARGB(255, 168, 142, 29), fontSize: 14),
            ),
        ],
      ),
    );
  }

  Widget _buildCurriculumItem(Subjects subject) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF292B2F),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Column(
          children: [
            Text(
              subject.date,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subject.monthYear,
              style: const TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Container(
          width: 1,
          height: 40,
          color: Colors.white54,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 8),
                  if (subject.isRated)
                    Row(
                      children: [
                        Text(
                          subject.rating?.toStringAsFixed(1) ?? 'N/A',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 8),
                      ],
                    ),
                  const Expanded(
                    child: Text(
                      'Rating', // Static text for rating
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/images/Frame 2085661773.png'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      subject.name,
                      style: const TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: const Color.fromARGB(255, 250, 250, 250),
              width: 2,
            ),
          ),
          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
        ),
      ],
    ),
  );
}


  Widget _buildSkillAssessmentSection(BuildContext context) {
    return Stack(
      children: [
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text(
                  'Skill\nAssessment',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
              ],
            ),
            Image.asset(
              'assets/images/file-fav-dynamic-premium.png',
              height: 145,
              width: 145,
            ),
          ],
        ),
      ],
    );
  }
}
