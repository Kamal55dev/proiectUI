import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier for managing the video list
class VideoController extends StateNotifier<List<Map<String, dynamic>>> {
  VideoController() : super([]);

  // Load video data (could be from an API or locally)
  void loadVideos() {
    state = [
      {
        'title': 'Men\'s Doubles Finals',
        'thumbnailPath': 'assets/images/thumbnail1.jpg',
        'views': 3240000,
        'likes': 1630,
      },
      {
        'title': 'Men\'s Singles Quarterfinals',
        'thumbnailPath': 'assets/images/thumbnail2.jpg',
        'views': 2240000,
        'likes': 1060,
      },
    ];
  }
}

// Riverpod provider for accessing the controller
final videoListProvider = StateNotifierProvider<VideoController, List<Map<String, dynamic>>>(
  (ref) => VideoController(),
);