import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'basic_overlay_widget.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);

  final VideoPlayerController? videoPlayerController;

  @override
  Widget build(BuildContext context) => videoPlayerController != null &&
          videoPlayerController!.value.isInitialized
      ? Container(
          padding: const EdgeInsets.only(top: 140),
          alignment: Alignment.topCenter,
          child: buildVideo())
      : const Center(
          child: CircularProgressIndicator(),
        );

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(
              child: BasicOverlayWidget(videoPlayerController)),
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: videoPlayerController!.value.aspectRatio,
      child: VideoPlayer(videoPlayerController!));
}
