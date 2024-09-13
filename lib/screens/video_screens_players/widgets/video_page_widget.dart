import 'package:flutter/material.dart';

class VideoTile extends StatelessWidget {
  final String title;
  final String thumbnailPath;
  final int views;
  final int likes;

  const VideoTile({
    Key? key,
    required this.title,
    required this.thumbnailPath,
    required this.views,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Local image asset
          Image.asset(
            thumbnailPath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$views views', style: TextStyle(color: Colors.grey)),
                Text('$likes likes', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}