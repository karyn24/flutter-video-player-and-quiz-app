import 'dart:convert';

//import 'package:course_app/videolist.dart';
//import 'package:course_app/videoplayerchewie.dart';
import 'package:video_player/video_player.dart';

import 'addvideopage.dart';
//import 'package:course_app/config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'config.dart';
import 'videolist.dart';
import 'videoplayerchewie.dart';



class MyShowVideo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YouTube API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var videoUrl;
  List videoList;
  bool loading = true;


  Future fetchAllVideo() async {
    final respnse = await http.get(Uri.parse(Config.FETCHDATA));
    print(respnse);
    if (respnse.statusCode == 200) {

      setState(() {
        videoList = jsonDecode(respnse.body);
        loading = false;
      });
      print(videoList);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to course learning"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddVideoPage(),),);
          })
        ],
      ),
      body: loading?Center(child: CircularProgressIndicator(
        backgroundColor: Colors.purpleAccent,
      ),
      )
          :ListView.builder(
          itemCount: videoList.length,
          itemBuilder: (context, index){
            print(videoList);

            final item = videoList[index];
            print(item);
            print("Works "+index.toString());
            return ListTile(
              onTap: (){
                print("Tapped #######################################################");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayVideoChewie(
                    url: Config.VIDEO_FOLDER+item['videoUrl']
                ),
                ),
                );
              },
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item['topic']),
              ),
              subtitle: VideoList(
                videoPlayerController: VideoPlayerController.network(Config.VIDEO_FOLDER+
                    item['videoUrl']),
                looping: true,
              ),
            );
          }),
    );
  }
}
