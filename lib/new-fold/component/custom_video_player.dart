// import 'package:video_player/video_player.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:helloworld/component/custom_icon_button.dart';
// import 'package:helloworld/screen/home_screen_playlist.dart';
//
// class CustomVideoPlayer extends StatefulWidget{
//   final XFile video;
//   final GestureTapCallback onNewVideoPressed;
//   const CustomVideoPlayer({required this.video, required this.onNewVideoPressed,Key? key}) : super(key: key);
//
//   @override
//   State<CustomVideoPlayer> createState() => _CustomVideoPlayer();
// }
//
// class _CustomVideoPlayer extends State<CustomVideoPlayer>{
//   bool showControls = false;
//   VideoPlayerController? videoController;
//
//   @override
//   void didUpdateWidget(covariant CustomVideoPlayer oldWidget){
//     super.didUpdateWidget(oldWidget);
//     if(oldWidget.video.path != widget.video.path){
//       initializeController();
//     }
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     initializeController();
//
//   }
//   initializeController() async{
//     final videoController = VideoPlayerController.file(File(widget.video.path));
//     await videoController.initialize();
//     videoController.addListener(videoControllerListener);
//     setState(() {
//       this.videoController = videoController;
//     });
//   }
//
//   void videoControllerListener(){
//     setState(() {
//
//     });
//   }
//
//   @override
//   void dispose(){
//      videoController?.removeListener(videoControllerListener);
//   }
//
//
//   @override
//   Widget build(BuildContext context){
//
//     if( videoController == null){
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           showControls = !showControls;
//         });
//       },
//
//       child: AspectRatio(aspectRatio: videoController!.value.aspectRatio,
//         child: Stack(
//           children: [
//             VideoPlayer(
//               videoController!,
//             ),
//             if(showControls)
//               Container(
//                  color: Colors.black.withOpacity(0.5),
//               ),
//             Positioned(
//                 bottom: 0,
//                 right: 0,
//                 left: 0,
//                 child:Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 0.8),
//                   child:Row(
//                   children: [
//                     renderTimeTextFromDuration(
//                       videoController!.value.position,
//                     ),
//                     Expanded(
//                         child:  Slider(
//                           onChanged: (double val){
//                             videoController!.seekTo(Duration(seconds: val.toInt()));
//                           },
//                           value: videoController!.value.position.inSeconds.toDouble(),
//                           min:0,
//                           max: videoController!.value.duration.inSeconds.toDouble(),
//                         ),
//                     ),
//                     renderTimeTextFromDuration(
//                       videoController!.value.duration,
//                     ),
//                   ],
//                   ),
//               ),
//               ),
//             if(showControls)
//               Align(
//                 alignment: Alignment.topRight,
//                 child: CustomIconButton(
//                   onPressed: widget.onNewVideoPressed,
//                   iconData: Icons.photo_camera_back,
//                 ),
//               ),
//             if(showControls)
//               Align(
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CustomIconButton(onPressed: onReversePressed, iconData: Icons.rotate_left),
//                     CustomIconButton(onPressed: onPlayPressed, iconData: videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow),
//                     CustomIconButton(onPressed: onForwardPressed, iconData: Icons.rotate_right),
//                   ],
//                 )
//               ),
//           ],
//         )
//       )
//       );
//   }
//   Widget renderTimeTextFromDuration(Duration duration){
//     return Text(
//       '${duration.inMinutes.toString().padLeft(2,'0')}:${(duration.inSeconds % 60).toString().padLeft(2,'0')}',
//       style: TextStyle(
//         color: Colors.white
//       ),
//     );
//   }
//
//   void onReversePressed(){
//     final currentPosition = videoController!.value.position;
//     Duration position = Duration();            // 0으로 초기화
//     if(currentPosition.inSeconds >3){
//       position = currentPosition - Duration(seconds: 3);
//     }
//     videoController!.seekTo(position);
//   }
//
//   void onForwardPressed(){
//     final maxPosition = videoController!.value.position;
//     final currentPosition = videoController!.value.position;
//     Duration position =maxPosition;
//     if((maxPosition - Duration(seconds: 3)).inSeconds > currentPosition.inSeconds){
//       position = currentPosition + Duration(seconds: 3);
//     }
//     videoController!.seekTo(position);
//   }
//
//   void onPlayPressed(){
//     if(videoController!.value.isPlaying){
//       videoController!.pause();
//     }
//     else{
//       videoController!.play();
//     }
//   }
//
//
//
// }