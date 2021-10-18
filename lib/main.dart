import 'package:flutter/material.dart';
import 'Functions/Attributes.dart';
//import 'package:Dealerware2/Images/picture_provider.dart';
//import 'package:Dealerware2/Views/Test.dart';
//import 'package:Dealerware2/Views/animated_appbar.dart';
//import 'package:firebase_core/firebase_core.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
//import 'dart:convert';
import 'Functions/myfunctions.dart';
import 'Account/Authetication.dart';
//import 'Views/ProductsView.dart';
//import 'Views/nestedTabBarView.dart';
//import 'Views/HomeDashboard.dart';
//import 'chatpage/home_screen.dart';
//import 'settingspage/menu_options_screen.dart';
//import 'Views/ProductDetail2.dart';
//import 'Test/toggle-button.dart';
//import 'Test/selectDate.dart';
//import 'Test/zoomImage.dart';
//import 'Test/batteryLevel.dart';
//import 'gps.dart';
//import 'Test/backgroundServices.dart';
//import 'Test/DetailPage.dart';

//import 'chatpage/NotificationPlugin.dart';
import 'package:sensors/sensors.dart';

var berlinWallFell = DateTime.utc(1989, 11, 9);
var moonLanding = DateTime.parse("1969-07-20 20:18:04Z");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 // final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key key,}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Dealerware',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/welcome',
      /*home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot){
            if(snapshot.hasError){
              print('You have an error! ${snapshot.error.toString()}');
              return Text('Sonthing went Wrong');
            } else if (snapshot.hasData){
              return LoginPage();
            } else {
              return Center(
                child: WelcomePage(title: 'atitle',),
              );
            }
          }
      ),*/
      routes: {
        //'/': (context) => LoginPage(title: 'atitle',),
       // '/dashboard': (context) => HomeDashboard(title: 'atitle',),
        '/welcome': (context) => WelcomePage(title: 'atitle',),
        '/login': (context) => LoginPage(),
        '/home': (context) => WelcomePage(title: 'atitle',),
        //'/register': (context) => RegisterPage(title: 'atitle',),
        '/reset': (context) => ResetPage(title: 'atitle',),
        //'/settings': (context) => SettingsTwoPage(),
        //'/chatpage': (context) => ChatPage(),
       // '/imgpage': (context) =>  ImageApp(),
        //'/productpage': (context) => MyProductsPage(),
        //'/test': (context) => TestPage(),
       // '/page': (context) => ProductView2(),
       // '/map': (context) =>SettingsTwoPage(),
        //'/sample': (context) =>SamplePage(),
       // '/date': (context) =>SelectDateApp(),
        //'/zoom': (context) => ZoomImage(),
       // '/battery': (context) => BatteryPage(),
       // '/service': (context) =>Services(),
       // '/details': (context) => DetailsPage(),



      },
    );
  }
}

class WelcomePage extends StatefulWidget {
  final String title;
  WelcomePage({Key key, this.title}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  void initWelcome() async {
    Future.delayed(Duration(seconds:2),(){
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void initState(){
    super.initState();
    initWelcome();


 /*   accelerometerEvents.listen((AccelerometerEvent event) {
      print(event);
    });
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      print(event);
    });
// [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
    });
// [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blue[800],
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/appimages/welcome.jpg'),
              fit:BoxFit.cover
            )
          ),
          child: Center(
            child:SpinKitCubeGrid(
              color: Colors.deepOrange,
              size:200.0,
            ),
          ),
        )
    );
  }


}