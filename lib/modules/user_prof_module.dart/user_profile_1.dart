// import 'package:badminton/modules/controllers/player_prof_provider/player_prof_provider.dart';
// import 'package:badminton/modules/user_prof_module.dart/personal_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../controllers/user_prof_provider/user_prof_provider_1.dart';
// import '../player_module/playing_prof.dart';

// class UserProfile_1 extends ConsumerWidget {
//   const UserProfile_1({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Watching the user profile state
//     final profileState = ref.watch(userProfileControllerProvider);
//     final profileController = ref.read(userProfileControllerProvider.notifier);

//     // Define the base text style
//     const TextStyle baseTextStyle = TextStyle(
//       fontFamily: 'Poppins',
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: Colors.white70,
//     );

//     return Scaffold(
//       backgroundColor: const Color(0xFF1C1C1E),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundImage: NetworkImage(userProfileState
//                         .profileImageUrl), // Dynamic profile image
//                   ),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Hello,",
//                         style: TextStyle(color: Colors.white70, fontSize: 16),
//                       ),
//                       Text(
//                         userProfileState.userName, // Dynamic user name
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.close, color: Colors.white),
//                     onPressed: () {
//                       Navigator.pop(context); // Close action
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF2C2C2E),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: const [
//                             Icon(Icons.qr_code,
//                                 color: Colors.white70, size: 20),
//                             SizedBox(width: 8),
//                             Text(
//                               "RAK Code",
//                               style: baseTextStyle,
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               profileState.rakCode,
//                               style: baseTextStyle.copyWith(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Vertical Divider
//                       if (MediaQuery.of(context).size.width > 600)
//                         const VerticalDivider(
//                           color: Colors.white70,
//                           thickness: 1,
//                           width: 20,
//                         ),
//                       // Contact Info with Icons
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 const Icon(Icons.email,
//                                     color: Colors.white70, size: 18),
//                                 const SizedBox(width: 1),
//                                 Text(
//                                   profileState.email,
//                                   style: baseTextStyle,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 5),
//                             Row(
//                               children: [
//                                 const Icon(Icons.phone,
//                                     color: Colors.white70, size: 18),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   profileState.phone,
//                                   style: baseTextStyle,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 // Additional Sections as per your design
//                 _buildResponsiveCard(
//                   context,
//                   child: Column(
//                     children: [
//                       _buildOption(
//                         icon: Icons.person,
//                         title: "Personal Info",
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const PersonalInfo(),
//                               ));
//                         },
//                         textStyle: baseTextStyle,
//                       ),
//                       _buildOption(
//                         icon: Icons.sports_tennis,
//                         title: "Playing Profile",
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const PlayingProfile(),
//                               ));
//                         },
//                         textStyle: baseTextStyle,
//                       ),
//                       _buildSwitchOption(
//                         icon: Icons.notifications,
//                         title: "Notifications",
//                         isEnabled: profileState.notificationsEnabled,
//                         onToggle: () => profileController.toggleNotifications(),
//                         textStyle: baseTextStyle,
//                       ),
//                       _buildLanguageSelector(
//                         selectedLanguage: profileState.selectedLanguage,
//                         onLanguageChanged: (language) =>
//                             profileController.updateLanguage(language),
//                         textStyle: baseTextStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 // Help & Support, Contact Us, and Privacy Policy
//                 _buildResponsiveCard(
//                   context,
//                   child: Column(
//                     children: [
//                       _buildOption(
//                         icon: Icons.help_outline,
//                         title: "Help & Support",
//                         onTap: () {},
//                         textStyle: baseTextStyle,
//                       ),
//                       _buildOption(
//                         icon: Icons.contact_mail,
//                         title: "Contact Us",
//                         onTap: () {},
//                         textStyle: baseTextStyle,
//                       ),
//                       _buildOption(
//                         icon: Icons.privacy_tip,
//                         title: "Privacy Policy",
//                         onTap: () {},
//                         textStyle: baseTextStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Responsive Card Builder
//   Widget _buildResponsiveCard(BuildContext context, {required Widget child}) {
//     return Card(
//       color: const Color(0xFF2C2C2E),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Padding(
//         padding: MediaQuery.of(context).size.width > 600
//             ? const EdgeInsets.all(16.0)
//             : const EdgeInsets.all(12.0),
//         child: child,
//       ),
//     );
//   }

//   // Build an Option in the List (e.g., Personal Info, Playing Profile)
//   Widget _buildOption({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//     required TextStyle textStyle,
//   }) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
//       leading: Icon(icon, color: Colors.white70, size: 20),
//       title: Text(
//         title,
//         style: textStyle,
//       ),
//       onTap: onTap,
//     );
//   }

//   // Build the Switch Option for Notifications
//   Widget _buildSwitchOption({
//     required IconData icon,
//     required String title,
//     required bool isEnabled,
//     required VoidCallback onToggle,
//     required TextStyle textStyle,
//   }) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
//       leading: Icon(icon, color: Colors.white70, size: 20),
//       title: Text(
//         title,
//         style: textStyle,
//       ),
//       trailing: Switch(
//         value: isEnabled,
//         onChanged: (value) => onToggle(),
//         activeColor: Colors.green,
//       ),
//     );
//   }

//   // Build the Language Selector
//   Widget _buildLanguageSelector({
//     required Language selectedLanguage,
//     required Function(Language) onLanguageChanged,
//     required TextStyle textStyle,
//   }) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
//       leading: const Icon(Icons.language, color: Colors.white70, size: 20),
//       title: const Text(
//         "Language",
//         style: TextStyle(
//           fontSize: 12,
//           color: Colors.white70,
//         ),
//       ),
//       trailing: DropdownButton<Language>(
//         value: selectedLanguage,
//         dropdownColor: const Color(0xFF2C2C2E),
//         underline: const SizedBox(),
//         icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
//         onChanged: (Language? newValue) {
//           if (newValue != null) onLanguageChanged(newValue);
//         },
//         items: Language.values
//             .map<DropdownMenuItem<Language>>((Language language) {
//           return DropdownMenuItem<Language>(
//             value: language,
//             child: Text(
//               language == Language.english ? 'English' : 'Spanish',
//               style: textStyle,
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
