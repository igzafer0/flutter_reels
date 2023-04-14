// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoController extends StatefulWidget {
  late VideoPlayerController controller;

  VideoController({super.key});

  @override
  State<VideoController> createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  var videoList = [
    "https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-fashion-woman-with-silver-makeup-39875-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-red-frog-on-a-log-1487-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4",
    "https://mixkit.co/free-stock-video/black-and-orange-tarantula-walking-vertical-shot-1482/",
    "https://assets.mixkit.co/videos/preview/mixkit-a-surfer-walking-on-the-beach-with-a-surfboard-1220-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-urban-man-puts-on-a-glasses-at-a-dark-room-1235-large.mp4"
  ];
  @override
  void initState() {
    super.initState();
    widget.controller = VideoPlayerController.network(
        videoList[Random().nextInt(videoList.length)])
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
