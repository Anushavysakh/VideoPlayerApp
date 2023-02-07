import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/widgets/orientation/video_player_fullscreen_widget.dart';
import 'package:wakelock/wakelock.dart';

import '../basic/network_player.dart';

class LandscapePlayerPage extends StatefulWidget {
  @override
  _LandscapePlayerPageState createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset('asset/videos/video2.mp4'.toString())
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());

    setLandscape();
  }

  @override
  void dispose() {
    controller!.dispose();
    setAllOrientations();

    super.dispose();
  }

  Future setLandscape() async {

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable(); // keep device awake
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    await Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) =>VideoPlayerFullscreenWidget(controller);
}
