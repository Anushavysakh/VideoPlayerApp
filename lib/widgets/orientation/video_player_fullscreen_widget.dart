import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../basic_overlay_widget.dart';

class VideoPlayerFullscreenWidget extends StatelessWidget {
  VideoPlayerController? controller;

  VideoPlayerFullscreenWidget(this.controller);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller!.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : const Center(child: CircularProgressIndicator());

  Widget buildVideo() => Stack(
        fit: StackFit.expand,
        children: <Widget>[buildVideoPlayer(), BasicOverlayWidget(controller)],
      );

  Widget buildVideoPlayer() => buildFullScreen(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );

  Widget buildFullScreen({
    required Widget child,
  }) {
    final size = controller?.value.size;
    final width = size?.width ?? 0;
    final height = size?.height ?? 0;

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(width: width, height: height, child: child),
    );
  }
}
