import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/video_page_controller.dart';
import '../widgets/video_page_widget.dart';

class VideoListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the videoListProvider to get the list of videos
    final videoList = ref.watch(videoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('RAK Podium'),
      ),
      body: videoList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                final video = videoList[index];
                return VideoTile(
                  title: video['title'],
                  thumbnailPath: video['thumbnailPath'],
                  views: video['views'],
                  likes: video['likes'],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Loading the video list when the button is pressed
          ref.read(videoListProvider.notifier).loadVideos();
        },
        child: Icon(Icons.refresh),
     ),
    );
  }
}