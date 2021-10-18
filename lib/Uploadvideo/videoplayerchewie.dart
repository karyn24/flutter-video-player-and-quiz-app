import 'package:Dealerware2/quiz/show_quiz.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideoChewie extends StatefulWidget {
  final String url;
  PlayVideoChewie({this.url});
  @override
  _PlayVideoChewieState createState() => _PlayVideoChewieState();
}

class _PlayVideoChewieState extends State<PlayVideoChewie> {
  VideoPlayerController _videoPlayerController;
  ChewieController  _chewieController;

  Future initilizeVideo()async{
    print("Mr Ben 2"+widget.url);
    _videoPlayerController = VideoPlayerController.network(widget.url);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    initilizeVideo();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text("Play Video"),
    ),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
          SizedBox(height:60.0),
      Container(
        height: 250,
        child: _chewieController != null && _chewieController.videoPlayerController.value.initialized? Chewie(
          controller: _chewieController,
        ):Center(child: CircularProgressIndicator(),),
      ),
            SizedBox(height:50.0),
            Container(
              //width: 100.0,
              margin:EdgeInsets.symmetric(horizontal:40.0),
              height: 50,
              child: ElevatedButton(
                child: Text('Start Quiz'),
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.deepOrange)),
                onPressed: () {
                  print('Pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyQuiz()),);

                },
              ),
            ),
      ],
      ),
    );
  }


  @override
  void dispose(){
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
