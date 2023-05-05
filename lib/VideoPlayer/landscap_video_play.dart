import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_explore/VideoPlayer/Components/video_player_control_unit.dart';
import 'package:video_player/video_player.dart';

// https://github.com/flutter/flutter/issues/17606

class LandscapVideoPlay extends StatefulWidget {
  final VideoPlayerController controller;
  const LandscapVideoPlay({
    super.key,
    required this.controller,
  });

  @override
  State<LandscapVideoPlay> createState() => _LandscapVideoPlayState();
}

class _LandscapVideoPlayState extends State<LandscapVideoPlay> {
  @override
  void initState() {
    _landscapeMode();
    super.initState();
  }

  void _landscapeMode() async {
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
  }

  @override
  void dispose() {
    _setAllOrientation();
    super.dispose();
  }

  void _setAllOrientation() async {
    await SystemChrome.setPreferredOrientations(
      // DeviceOrientation.values,
      [
        DeviceOrientation.portraitUp,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AspectRatio(
            aspectRatio: 1280 / 720,
            child: VideoPlayer(widget.controller),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: VideoPlayerControlUnit(
                controller: widget.controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
