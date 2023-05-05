import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControlUnit extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerControlUnit({
    super.key,
    required this.controller,
  }) : _controller = controller;
  final VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, VideoPlayerValue value, child) {
            return Text(
              videoDuration(value.position),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade800,
              ),
            );
          },
        ),
        Flexible(
          child: SizedBox(
            height: 5.5,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              colors: VideoProgressColors(
                bufferedColor: Colors.grey.shade500,
                backgroundColor: Colors.grey.shade400,
                playedColor: Colors.red.shade700,
              ),
            ),
          ),
        ),
        Text(
          videoDuration(_controller.value.duration),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade900,
          ),
        ),
      ],
    );
  }

  String videoDuration(Duration duration) {
    String twoDigit(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigit(duration.inHours);
    final minute = twoDigit(duration.inMinutes.remainder(60));
    final second = twoDigit(duration.inSeconds.remainder(60));

    final time = [if (duration.inHours > 0) hours, minute, second].join(":");
    return time;
  }
}
