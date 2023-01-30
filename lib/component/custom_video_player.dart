import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget{
  final XFile video;
  const CustomVideoPlayer({required this.video, Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer>{
  VideoPlayerController? videoController;

  @override
  void initState(){
    super.initState();
    initializeController();

  }
  initializeController() async{
    final videoController = VideoPlayerController.file(File(widget.video.path));
    await videoController.initialize();
    setState(() {
      this.videoController = videoController;
    });
  }

  @override
  Widget build(BuildContext context){

    if( videoController == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return AspectRatio(aspectRatio: videoController!.value.aspectRatio,
      child: VideoPlayer(
        videoController!,
      ),
    );
  }
}