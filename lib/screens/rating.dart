import 'package:flutter/material.dart';

class AssessmentReportScreen extends StatelessWidget {
  const AssessmentReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Assessment Report',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(Icons.close, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildRatingSection(),
          const SizedBox(height: 20),
          _buildSkillSection('Footwork', 'JP'),
          const SizedBox(height: 10),
          _buildSkillSection('Posture Balance', 'JP'),
          const SizedBox(height: 10),
          _buildSkillSection('Racket Skills', 'JP'),
          const SizedBox(height: 10),
          _buildSkillSection('Tactical Skills', 'JP'),
          const Spacer(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildRatingSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          const Text(
            'Overall Rating',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '4.2',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Stars',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today, color: Colors.grey, size: 16),
              const SizedBox(width: 8),
              const Text(
                '18 Sep 2024',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: const Text(
                  'JP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Some random comments made by the coach on the player\'s ability to use this foot better to reach to the ball and performs a good smash',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillSection(String skillName, String initials) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                skillName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              Row(
                children: List.generate(4, (index) {
                  return const Icon(Icons.star, color: Colors.yellow, size: 16);
                })..add(
                    const Icon(Icons.star_border, color: Colors.grey, size: 16),
                  ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Text(
                  initials,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: const Text(
                  'Some random comments made by the coach on the player\'s ability to use this foot better to reach to the ball and performs a good smash',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.share, color: Colors.black),
      label: const Text(
        'Share it with your friends',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        // Share functionality
      },
    );
  }
}
