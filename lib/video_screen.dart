// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_reels/video_controller.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});

  List<VideoController> dataList = [];

  var videoList = [
    "https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-fashion-woman-with-silver-makeup-39875-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-red-frog-on-a-log-1487-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-black-and-orange-tarantula-walking-vertical-shot-1482-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-a-surfer-walking-on-the-beach-with-a-surfboard-1220-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-urban-man-puts-on-a-glasses-at-a-dark-room-1235-large.mp4"
  ];

  int oldValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          itemCount: 150,
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            dataList[oldValue].controller.pause();
            dataList[value].controller.play();
            oldValue = value;
          },
          itemBuilder: ((context, index) {
            dataList.add(
              VideoController(
                url: videoList[index % videoList.length],
                index: index,
              ),
            );
            return dataList[index];
          }),
        ),
      ),
    );
  }
}
