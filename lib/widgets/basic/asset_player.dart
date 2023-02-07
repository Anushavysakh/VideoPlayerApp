import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/widgets/video_player_widget.dart';

class AssetPlayer extends StatefulWidget {
  const AssetPlayer({Key? key}) : super(key: key);

  @override
  State<AssetPlayer> createState() => _AssetPlayerState();
}

class _AssetPlayerState extends State<AssetPlayer> {
  VideoPlayerController? videoPlayerController;

  final asset = 'asset/videos/video1.mp4';

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.asset(asset.toString())
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => videoPlayerController!.play());

    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = videoPlayerController?.value.volume == 0;

    return Column(
      children: [
        Expanded(
            child: VideoPlayerWidget(
                videoPlayerController: videoPlayerController)),
        SizedBox(
          height: 30,
        ),
        if (videoPlayerController != null &&
            videoPlayerController!.value.isInitialized)
          CircleAvatar(
            radius: 30,
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                videoPlayerController?.setVolume(isMuted ? 1 : 0);
              },
              icon: Icon(
                isMuted ? Icons.volume_mute : Icons.volume_up,
              ),
            ),
          )
      ],
    );
  }
}
