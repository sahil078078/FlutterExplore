import 'package:flutter/material.dart';

import 'Components/video_collection.dart';

class VideoDetails extends StatefulWidget {
  final VideoInfo videoInfo;
  const VideoDetails({
    super.key,
    required this.videoInfo,
  });

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  Widget titleValue({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3.5),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoInfo.title),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleValue(
              title: "Title",
              value: widget.videoInfo.title,
            ),
            const SizedBox(height: 10),
            titleValue(
              title: "Producer by",
              value: widget.videoInfo.subtitle,
            ),
            const SizedBox(height: 10),
            titleValue(
              title: "Description",
              value: widget.videoInfo.description,
            ),
          ],
        ),
      ),
    );
  }
}
