// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_reels/video_controller.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<VideoController> dataList = [];
  int oldValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PageView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                dataList[oldValue].controller.pause();
                dataList[value].controller.play();
                oldValue = value;
              },
              itemBuilder: ((context, index) {
                dataList.add(VideoController());
                return dataList[index];
              }))),
    );
  }
}
