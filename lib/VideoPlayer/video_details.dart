import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_explore/VideoPlayer/landscap_video_play.dart';
import 'package:video_player/video_player.dart';

import 'Components/leading_icon.dart';
import 'Components/video_collection.dart';
import 'Components/video_player_control_unit.dart';

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
  late VideoPlayerController _controller;

  void videoPlayerInit() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoInfo.sources),
    )
      ..setLooping(false)
      ..addListener(
        () {
          if (mounted) setState(() {});
        },
      )
      ..initialize().then(
        (value) => _controller.play(),
      );
  }

  @override
  void initState() {
    videoPlayerInit();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        leading: const LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _controller.value.isInitialized
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            children: [
                              VideoPlayer(_controller),
                              Positioned(
                                right: 15,
                                bottom: 10,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => LandscapVideoPlay(
                                          controller: _controller,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: Image.asset(
                                        'assets/VideoPlayer/full-screen.png',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: VideoPlayerControlUnit(
                            controller: _controller,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () async {
                                  final currentPosition =
                                      _controller.value.position;
                                  final newPosition = currentPosition -
                                      const Duration(seconds: 10);
                                  await _controller.seekTo(newPosition);
                                },
                                onDoubleTap: () async {
                                  final currentPosition =
                                      _controller.value.position;
                                  final newPosition = currentPosition -
                                      const Duration(seconds: 20);
                                  await _controller.seekTo(newPosition);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 15,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: () {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: () async {
                                  final currentPosition =
                                      _controller.value.position;
                                  final newPosition = currentPosition +
                                      const Duration(seconds: 10);

                                  await _controller.seekTo(newPosition);
                                },
                                onDoubleTap: () async {
                                  final currentPosition =
                                      _controller.value.position;
                                  final newPosition = currentPosition +
                                      const Duration(seconds: 20);

                                  await _controller.seekTo(newPosition);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: widget.videoInfo.thumb,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => SizedBox(
                            child: Image.asset(
                              "assets/VideoPlayer/no_movie.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const SizedBox(
                        height: 2,
                        child: LinearProgressIndicator(
                          backgroundColor: Color(0xff00B9F1),
                          color: Color(0xff002E6E),
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
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
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
