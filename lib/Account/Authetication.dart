import 'dart:convert';
//import 'dart:html';

import 'package:Dealerware2/Uploadvideo/showvideo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
//import 'dart:convert';
import '../Functions/Attributes.dart';
import '../Functions/myfunctions.dart';
//import 'package:Dealerware2/Images/picture_provider.dart';
//import 'package:Dealerware2/Views/Test.dart';
//import 'package:Dealerware2/Views/animated_appbar.dart';
//import 'package:firebase_core/firebase_core.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController eml = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = "http://192.168.8.145/LOGIN/login.php";
    var response = await http.post(url,body: {
      "email": eml.text,
      "password": pass.text,
    });
    var data =   json.decode(json.encode(response.body));

    if( data == "Login Success"){
      Fluttertoast.showToast(msg: "Logged successfully",toastLength: Toast.LENGTH_SHORT);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyShowVideo()),);

    }
      //Navigator.push(context, MaterialPageRoute(builder: (context) => MyShowVideo()),);

    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Login")),
      //backgroundColor: Colors.blueGrey,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 60.0),
            Center(
              child: Text(
                  'Mastiff Security course learning App',
                  style: TextStyle(
                    fontSize: 18.0,
                    //fontWeight: FontWeight.bold
                  )
              ),
            ),
            Center(
              child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 36.0,
                    //fontWeight: FontWeight.bold
                  )
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 40.0,
              child: logStatus(),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                controller: eml,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                controller: pass,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              //width: 100.0,
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              height: 50,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  print('Login Pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyShowVideo()),);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      child: Text('Register'),
                      onPressed: () {
                        print('Register Pressed');
                        respText = "";
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      }
                  ),
                  SizedBox(width: 40.0),
                  TextButton(
                      child: Text('Forgotten Password?'),
                      onPressed: () {
                        respText = "";
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPage()),
                        );
                        print('Pressed');
                      }
                  ),
                ]
            ),
          ],
        )
    );
  }
}



class ResetPage extends StatefulWidget {
  final String title;
  ResetPage({Key key, this.title}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController contEmail = TextEditingController();

  Future<int> runReset(String aEmail) async{
    if(aEmail == "") {
      respStatus = "";
      setState(() { respText = "Please enter email address!"; });
      return 0;
    }

    setState(() { respStatus = "prog"; });

    qQuTraceAuth = "0";
    inEle = {'EmailN':aEmail,};
    dynamic res = await onQutracePostem('MReset', 0, inEle, '');

    print(res[2]);

    if(res[0] == "suc"){
      setState(() { respStatus = res[2]; });
      //Navigator.push(context, MaterialPageRoute(builder: (context) =>MyHomePage()),);
      Navigator.pushReplacementNamed(context, '/login');
      return 1;
    }

    respStatus = "";
    setState(() { respText = res[2]; });
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Password Change")),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height:100.0),
            Center(
              child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 36.0,
                    //fontWeight: FontWeight.bold
                  )
              ),
            ),
            SizedBox(height:10.0),
            logStatus(),
            SizedBox(height:8.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                controller: contEmail,
              ),
            ),
            SizedBox(height:15.0),
            Container(
              //width: 100.0,
              margin:EdgeInsets.symmetric(horizontal:40.0),
              height: 50,
              child: ElevatedButton(
                child: Text('Submit',
                  style: TextStyle(fontSize: 28),),
                onPressed: () {
                  runReset(contEmail.text);
                },
              ),
            ),
            SizedBox(height:40.0),
          ],
        )
    );
  }
}

Widget logStatus(){
  if(respStatus == 'prog') {
    return Center(
      child: SpinKitFadingCircle(
        color: Colors.deepOrange,
        size: 40.0,
      ),
    );
  }

  return Center(
    child: Text(
        respText,
        style: TextStyle(
          fontSize: 16.0,
          color:Colors.red,
          fontStyle: FontStyle.italic,
        )
    ),
  );
}