import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  VideoList({this.videoPlayerController,this.looping});
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        looping: widget.looping,
        autoInitialize: true,
        aspectRatio: 3/2,
        errorBuilder: (context,errorMsg){
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Chewie(controller: chewieController),
    );
  }
  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
  }
}
