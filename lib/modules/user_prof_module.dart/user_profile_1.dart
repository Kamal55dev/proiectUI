import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/user_prof_provider/user_prof_provider_1.dart';

class UserProfile_1 extends ConsumerWidget {
  const UserProfile_1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileState = ref.watch(userProfileControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(userProfileState
                        .profileImageUrl), // Dynamic profile image
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello,",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      Text(
                        userProfileState.userName, // Dynamic user name
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Close action
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.qr_code,
                                color: Colors.white70, size: 20),
                            SizedBox(width: 8),
                            Text(
                              "RAK Code",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userProfileState.rakCode, // Dynamic RAK code
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userProfileState.email, // Dynamic email
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userProfileState.phone, // Dynamic phone
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildOption(Icons.person, "Personal Info", onTap: () {}),
              _buildOption(Icons.sports_tennis, "Playing Profile",
                  onTap: () {}),
              _buildSwitchOption(
                  Icons.notifications, "Notifications", ref, userProfileState),
              _buildOption(Icons.language, "Language", onTap: () {
                ref.read(userProfileControllerProvider.notifier).updateLanguage(
                      userProfileState.selectedLanguage == Language.english
                          ? Language.spanish
                          : Language.english,
                    );
              }),
              Text(
                userProfileState.selectedLanguage == Language.english
                    ? 'English'
                    : 'Spanish',
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const Spacer(),
              _buildOption(Icons.help_outline, "Help & Support", onTap: () {}),
              _buildOption(Icons.contact_mail, "Contact Us", onTap: () {}),
              _buildOption(Icons.privacy_tip, "Privacy Policy", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title,
      {required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchOption(
      IconData icon, String title, WidgetRef ref, UserProfileState state) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
      trailing: Switch(
        value: state.notificationsEnabled,
        onChanged: (value) {
          ref
              .read(userProfileControllerProvider.notifier)
              .toggleNotifications();
        },
        activeColor: const Color(0xFFDAA520),
      ),
    );
  }
}
