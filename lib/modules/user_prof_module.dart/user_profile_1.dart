import 'package:badminton/modules/controllers/player_prof_provider/player_prof_provider.dart';
import 'package:badminton/modules/user_prof_module.dart/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/user_prof_provider/user_prof_provider_1.dart';
import '../player_module/playing_prof.dart';

class UserProfile_1 extends ConsumerWidget {
  const UserProfile_1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the user profile state
    final profileState = ref.watch(userProfileControllerProvider);
    final profileController = ref.read(userProfileControllerProvider.notifier);

    // Define the base text style
    const TextStyle baseTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: MediaQuery.of(context).size.width > 600
                ? const EdgeInsets.symmetric(horizontal: 40.0)
                : const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top row with profile image, username, and close button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Image Section
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 600 ? 80 : 60,
                      child: CircleAvatar(
                        radius:
                            MediaQuery.of(context).size.width > 600 ? 40 : 30,
                        backgroundColor: Colors.grey[800],
                        backgroundImage: profileState.profileImageUrl.isNotEmpty
                            ? NetworkImage(profileState.profileImageUrl)
                            : null,
                        child: profileState.profileImageUrl.isEmpty
                            ? const Icon(Icons.person,
                                size: 40, color: Colors.white)
                            : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // User's Name and Greeting
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: baseTextStyle,
                          ),
                          Text(
                            profileState.userName,
                            style: baseTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Close button
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Handle navigation back
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // RAK Code and Contact Info Section
                _buildResponsiveCard(
                  context,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // RAK Code
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "RAK Code",
                              style: baseTextStyle,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              profileState.rakCode,
                              style: baseTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Vertical Divider
                      if (MediaQuery.of(context).size.width > 600)
                        const VerticalDivider(
                          color: Colors.white70,
                          thickness: 1,
                          width: 20,
                        ),
                      // Contact Info with Icons
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.email,
                                    color: Colors.white70, size: 18),
                                const SizedBox(width: 1),
                                Text(
                                  profileState.email,
                                  style: baseTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.phone,
                                    color: Colors.white70, size: 18),
                                const SizedBox(width: 5),
                                Text(
                                  profileState.phone,
                                  style: baseTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Additional Sections as per your design
                _buildResponsiveCard(
                  context,
                  child: Column(
                    children: [
                      _buildOption(
                        icon: Icons.person,
                        title: "Personal Info",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PersonalInfo(),
                              ));
                        },
                        textStyle: baseTextStyle,
                      ),
                      _buildOption(
                        icon: Icons.sports_tennis,
                        title: "Playing Profile",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlayingProfile(),
                              ));
                        },
                        textStyle: baseTextStyle,
                      ),
                      _buildSwitchOption(
                        icon: Icons.notifications,
                        title: "Notifications",
                        isEnabled: profileState.notificationsEnabled,
                        onToggle: () => profileController.toggleNotifications(),
                        textStyle: baseTextStyle,
                      ),
                      _buildLanguageSelector(
                        selectedLanguage: profileState.selectedLanguage,
                        onLanguageChanged: (language) =>
                            profileController.updateLanguage(language),
                        textStyle: baseTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Help & Support, Contact Us, and Privacy Policy
                _buildResponsiveCard(
                  context,
                  child: Column(
                    children: [
                      _buildOption(
                        icon: Icons.help_outline,
                        title: "Help & Support",
                        onTap: () {},
                        textStyle: baseTextStyle,
                      ),
                      _buildOption(
                        icon: Icons.contact_mail,
                        title: "Contact Us",
                        onTap: () {},
                        textStyle: baseTextStyle,
                      ),
                      _buildOption(
                        icon: Icons.privacy_tip,
                        title: "Privacy Policy",
                        onTap: () {},
                        textStyle: baseTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Responsive Card Builder
  Widget _buildResponsiveCard(BuildContext context, {required Widget child}) {
    return Card(
      color: const Color(0xFF2C2C2E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: MediaQuery.of(context).size.width > 600
            ? const EdgeInsets.all(16.0)
            : const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }

  // Build an Option in the List (e.g., Personal Info, Playing Profile)
  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required TextStyle textStyle,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
      leading: Icon(icon, color: Colors.white70, size: 20),
      title: Text(
        title,
        style: textStyle,
      ),
      onTap: onTap,
    );
  }

  // Build the Switch Option for Notifications
  Widget _buildSwitchOption({
    required IconData icon,
    required String title,
    required bool isEnabled,
    required VoidCallback onToggle,
    required TextStyle textStyle,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
      leading: Icon(icon, color: Colors.white70, size: 20),
      title: Text(
        title,
        style: textStyle,
      ),
      trailing: Switch(
        value: isEnabled,
        onChanged: (value) => onToggle(),
        activeColor: Colors.green,
      ),
    );
  }

  // Build the Language Selector
  Widget _buildLanguageSelector({
    required Language selectedLanguage,
    required Function(Language) onLanguageChanged,
    required TextStyle textStyle,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
      leading: const Icon(Icons.language, color: Colors.white70, size: 20),
      title: const Text(
        "Language",
        style: TextStyle(
          fontSize: 12,
          color: Colors.white70,
        ),
      ),
      trailing: DropdownButton<Language>(
        value: selectedLanguage,
        dropdownColor: const Color(0xFF2C2C2E),
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
        onChanged: (Language? newValue) {
          if (newValue != null) onLanguageChanged(newValue);
        },
        items: Language.values
            .map<DropdownMenuItem<Language>>((Language language) {
          return DropdownMenuItem<Language>(
            value: language,
            child: Text(
              language == Language.english ? 'English' : 'Spanish',
              style: textStyle,
            ),
          );
        }).toList(),
      ),
    );
  }
}
