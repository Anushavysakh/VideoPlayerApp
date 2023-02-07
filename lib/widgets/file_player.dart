import 'dart:html';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/widgets/video_player_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'floating_action_button_widget.dart';

class FilePlayer extends StatefulWidget {
  const FilePlayer({Key? key}) : super(key: key);

  @override
  State<FilePlayer> createState() => _FilePlayerState();
}

class _FilePlayerState extends State<FilePlayer> {
final File? file =
File('file','D:\videos\production ID_4875313.mp4');

VideoPlayerController? controller;

  _FilePlayerState(this.file);

@override
void initState() {
  super.initState();

  if (file.existsSync()) {
    controller = VideoPlayerController.file(file)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
  }
}

@override
void dispose() {
  controller?.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) => Scaffold(
  body: Column(
    children: [
      VideoPlayerWidget(videoPlayerController: controller),
      buildAddButton(),
    ],
  ),
);

Widget buildAddButton() => Container(
  padding: EdgeInsets.all(32),
  child: FloatingActionButtonWidget(
    onPressed: () async {
      final file = await pickVideoFile();
      if (file == null) return;

      controller = VideoPlayerController.file(file)
        ..addListener(() => setState(() {}))
        ..setLooping(true)
        ..initialize().then((_) {
          controller!.play();
          setState(() {});
        });
    },
  ),
);

Future<File> pickVideoFile() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.video);
  if (result == null) return null;

  return File(result.files.single.path);
}
}