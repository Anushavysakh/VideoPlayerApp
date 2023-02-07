import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/widgets/orientation/video_player_fullscreen_widget.dart';

import '../basic/network_player.dart';
import '../basic_overlay_widget.dart';

class PortraitPlayer extends StatefulWidget {
  const PortraitPlayer({Key? key}) : super(key: key);

  @override
  State<PortraitPlayer> createState() => _PortraitPlayerState();
}

class _PortraitPlayerState extends State<PortraitPlayer> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    final asset = 'asset/videos/video1.mp4';
    controller = VideoPlayerController.asset('asset/videos/video2.mp4'.toString())
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => VideoPlayerFullscreenWidget( controller);
}



