// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoController extends StatefulWidget {
  late VideoPlayerController controller;
  String url;
  VideoController({super.key, required this.url});

  @override
  State<VideoController> createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  @override
  void initState() {
    super.initState();
    widget.controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          widget.controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: widget.controller.value.size.width,
                    height: widget.controller.value.size.height,
                    child: VideoPlayer(widget.controller),
                  ),
                ),
              )
            : Container(
                color: Colors.black,
              ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
