// // lib/ui/rak_main_screen.dart
// import 'package:badminton/screens/rak_curriculum/rak_main_screen/controller/main_screen_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../common/common_padding.dart';
// import '../../../player_curriculam_main_page.dart';

// class RAKMainScreen extends ConsumerWidget {
//   const RAKMainScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final rakState = ref.watch(rakControllerProvider);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: 
//         Padding(
//           padding: responsiveAllPadding(context, 0.03),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(rakState.userName),
//               const SizedBox(height: 20),
//               _buildExperienceRAK(),
//               const SizedBox(height: 20),
//               _buildAcademyCard(context,rakState.academyName),
//               const SizedBox(height: 20),
//               _buildQuickActions(),
//               const SizedBox(height: 20),
//               _buildRAKCoachConnect(),
//               const Divider(),
//               const SizedBox(height: 20),
//               _buildRAKShow(),
//             ],
//           ),
//         ),
//       ),
//       )
//     );
//   }

//   Widget _buildHeader(String userName) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             const CircleAvatar(
//               radius: 20,
//               backgroundImage: AssetImage('assets/images/profile_image/coach_player_home_profile_image.png'),
//             ),
//             const SizedBox(width: 125),
//             Text(
//               userName,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         const Icon(Icons.notifications, color: Colors.white),
//       ],
//     );
//   }

//   Widget _buildExperienceRAK() {
//   return Container(
//     height: 200, // Adjust this value as needed
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       image: const DecorationImage(
//         image: AssetImage('assets/images/bg_images/Looper Bg image.png'), // Replace with your background image path
//         fit: BoxFit.cover,
//       ),
//     ),
//     child: Stack(
//       children: [
//         // Gradient overlay
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Colors.black.withOpacity(0.7), Colors.transparent],
//             ),
//           ),
//         ),
//         // Yellow glow effect
//         // Positioned(
//         //   right: -50,
//         //   top: -50,
//         //   child: Container(
//         //     width: 200,
//         //     height: 200,
//         //     decoration: BoxDecoration(
//         //       shape: BoxShape.circle,
//         //       gradient: RadialGradient(
//         //         colors: [
//         //           Colors.yellow.withOpacity(0.2),
//         //           Colors.transparent,
//         //         ],
//         //         stops: [0.5, 1],
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // Content
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Experience',
//                     style: TextStyle(color: Colors.white, fontSize: 28),
//                   ),
//                   Text(
//                     'the power of RAK !',
//                     style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 0, right: 0),
//               child: Image.asset(
//                 'assets/images/player_images/logo_image.png',
//                 height: 100,
//                 width: 100,
//               ),
//             ),
//           ),
//               // Image.asset(
//               //   'assets/images/player_images/logo_image.png', 
//               //   height: 100, 
//               //   width: 100,
//               // ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildAcademyCard(BuildContext context,String academyName) {
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const PlayerCurriculumMainScreen(), // Replace this with your target screen
//         ),
//       );
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           Image.asset('assets/images/player_images/badminton_academy_image.png', height: 30),
//           const SizedBox(width: 10),
//           Text(
//             academyName,
//             style: const TextStyle(color: Colors.white, fontSize: 16),
//           ),
//         ],
//       ),
//     ),
//   );
// }


//   // Widget _buildAcademyCard(String academyName) {
//   //   return Container(
//   //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//   //     decoration: BoxDecoration(
//   //       color: const Color(0xFF1E1E1E),
//   //       borderRadius: BorderRadius.circular(15),
//   //     ),
//   //     child: Row(
//   //       children: [
//   //         Image.asset('assets/images/player_images/badminton_academy_image.png', height: 30),
//   //         const SizedBox(width: 10),
//   //         Text(
//   //           academyName,
//   //           style: const TextStyle(color: Colors.white, fontSize: 16),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget _buildQuickActions() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildActionButton(Icons.calendar_today, 'Schedule'),
//         _buildActionButton(Icons.favorite, 'Wellness'),
//         _buildActionButton(Icons.description, 'Report'),
//         _buildActionButton(Icons.sports_tennis, 'Matches'),
//       ],
//     );
//   }

//   Widget _buildActionButton(IconData icon, String label) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: const Color(0xFF1E1E1E),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(icon, color: Colors.white),
//         ),
//         const SizedBox(height: 5),
//         Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
//       ],
//     );
//   }

//   Widget _buildRAKCoachConnect() {
//     return Stack(
//       children: [
//         // Flash effect
//         Positioned(
//           right: 0,
//           child: Container(
//             height: 150,
//             width: 150,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: RadialGradient(
//                 colors: [
//                   Colors.orange.withOpacity(0.30),
//                   Colors.transparent,
//                 ],
//                 stops: const [0.5, 1],
//               ),
//             ),
//           ),
//         ),
//         // Content
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'RAK\nCoach Connekt',
//                   style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const Text(
//                   'Reach to the best coach',
//                   style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
//                 ),
//                 const SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                   //   Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => const RakPodium(),
//                   //   ),
//                   // );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFB08900), // Updated button color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Row(
//                     children: [
//                       Text('Get Coach'),
//                       SizedBox(width: 5),
//                       Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16), // Arrow icon inside the button
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // Trophy image above flash
//             Image.asset(
//               'assets/images/player_images/rak_coach_connekt_image.png',  // Replace with your image path
//               height: 145,
//               width: 145,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

// Widget _buildRAKShow() {
//   return Stack(
//     children: [
//       // Background image
//       Image.asset('assets/images/player_images/rak_curriculam_image.png'),
      
//       // Circular gradient overlay
//       Positioned(
//         right: 10,
//         top: 20,
//         child: Container(
//           height: 150,
//           width: 150,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: RadialGradient(
//               colors: [
//                 Colors.white.withOpacity(0.50),
//                 Colors.transparent,
//               ],
//               stops: const [0.5, 1],
//             ),
//           ),
//         ),
//       ),
      
//       // Main content
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Image above the container
//           Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 40, right: 32),
//               child: Image.asset(
//                 'assets/images/player_images/rak_show_image.png',
//                 height: 100,
//               ),
//             ),
//           ),
          
//           // Spacer
//           const SizedBox(height: 10),
          
//           // Colored container with text
          
//            const Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                  Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: EdgeInsets.only(top: 0, right: 45 ),
//               child:Text(
//                   'RAK Show',
//                   style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//             )
//                  ),
                
//                 SizedBox(height: 5),
//                 Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: EdgeInsets.only(top: 0, right: 35),
//               child:Text(
//                   'Shoot. Share. Shine.',
//                   style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
//                 ),
//             )
//                  ),
                
//               ],
//             ),
//         ]
//           ),
//         ],
//       );
// }
// }


import 'package:badminton/modules/player_module/player_rak/controller/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/common_padding.dart';
import '../../player_events/views/events_page.dart';
import 'player_curriculam_main_page.dart';

class RAKMainScreen extends ConsumerWidget {
  const RAKMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rakState = ref.watch(rakControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: responsiveAllPadding(context, 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(rakState.userName),
                const SizedBox(height: 20),
                _buildExperienceRAK(),
                const SizedBox(height: 20),
                _buildAcademyCard(context, rakState.academyName),
                const SizedBox(height: 20),
                _buildQuickActions(context), // Pass context to _buildQuickActions
                const SizedBox(height: 20),
                _buildRAKCoachConnect(),
                const Divider(),
                const SizedBox(height: 20),
                _buildRAKShow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String userName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile_image/coach_player_home_profile_image.png'),
            ),
            const SizedBox(width: 125),
            Text(
              userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Icon(Icons.notifications, color: Colors.white),
      ],
    );
  }

  Widget _buildExperienceRAK() {
    return Container(
      height: 200, // Adjust this value as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/bg_images/Looper Bg image.png'), // Replace with your background image path
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Experience',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    Text(
                      'the power of RAK !',
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, right: 0),
                    child: Image.asset(
                      'assets/images/player_images/logo_image.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademyCard(BuildContext context, String academyName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlayerCurriculumMainScreen(), // Replace this with your target screen
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/player_images/badminton_academy_image.png', height: 30),
            const SizedBox(width: 10),
            Text(
              academyName,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(context, Icons.calendar_today, 'Schedule', ScheduleWidget()), // Pass context and widget
        _buildActionButton(context, Icons.favorite, 'Wellness', null), // Placeholder for other actions
        _buildActionButton(context, Icons.description, 'Report', null),
        _buildActionButton(context, Icons.sports_tennis, 'Matches', null),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label, Widget? targetScreen) {
    return GestureDetector(
      onTap: () {
        if (targetScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => targetScreen,
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildRAKCoachConnect() {
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
                  'RAK\nCoach Connekt',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Reach to the best coach',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB08900), // Updated button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text('Get Coach'),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16), // Arrow icon inside the button
                    ],
                  ),
                ),
              ],
            ),
            // Trophy image above flash
            Image.asset(
              'assets/images/player_images/rak_coach_connekt_image.png',  // Replace with your image path
              height: 145,
              width: 145,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRAKShow() {
    return Stack(
      children: [
        // Background image
        Image.asset('assets/images/player_images/rak_curriculam_image.png'),
        
        // Circular gradient overlay
        Positioned(
          right: 10,
          top: 20,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.white.withOpacity(0.50),
                  Colors.transparent,
                ],
                stops: const [0.5, 1],
              ),
            ),
          ),
        ),
        
        // Main content
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image above the container
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 32),
                child: Image.asset(
                  'assets/images/player_images/rak_show_image.png',
                  height: 100,
                ),
              ),
            ),
            
            // Spacer
            const SizedBox(height: 10),
            
            // Colored container with text
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, right: 45),
                    child: Text(
                      'RAK Show',
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, right: 35),
                    child: Text(
                      'Shoot. Share. Shine.',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
