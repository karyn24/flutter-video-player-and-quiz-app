import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddVideoPage extends StatefulWidget {
  @override
  _AddVideoPageState createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  var videoUrl;

  Future choichVideo() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      setState(() {
        videoUrl = file.name;
      });
      print(videoUrl);
    } else {
      // User canceled the picker
    }
  }
  Future saveVideo() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Video"),),
      body: Column(children: [
        Center(
          child: OutlineButton(
            onPressed: () {
              choichVideo();
            },
            child: Text("Upload video"),),
        ),
        SizedBox(height: 20,),
        Center(child: Text("video Url"),)
      ],),
    );
  }

}
