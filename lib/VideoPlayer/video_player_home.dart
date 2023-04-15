import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_explore/VideoPlayer/video_details.dart';
import 'Components/video_play_card.dart';
import 'Components/video_collection.dart';

class VideoPlayerHome extends StatelessWidget {
  const VideoPlayerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Videos Collection",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: videoCollection.length,
                itemBuilder: (context, index) {
                  final VideoInfo videoInfo = videoCollection.elementAt(index);
                  return VideoPlayCard(
                    videoInfo: videoInfo,
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => VideoDetails(
                          videoInfo: videoInfo,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
