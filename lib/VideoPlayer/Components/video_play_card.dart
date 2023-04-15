import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'video_collection.dart';

class VideoPlayCard extends StatelessWidget {
  const VideoPlayCard({
    super.key,
    required this.videoInfo,
    required this.onTap,
  });

  final VideoInfo videoInfo;
  final GestureTapCallback  onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 0.95,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 150,
                  child: CachedNetworkImage(
                    imageUrl: videoInfo.thumb,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => SizedBox(
                      child: Image.asset(
                        "assets/VideoPlayer/no_movie.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 12,
                  top: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoInfo.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      videoInfo.subtitle,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
