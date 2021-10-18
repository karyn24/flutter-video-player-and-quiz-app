import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'Account/Authetication.dart';


class RegisterPage extends StatefulWidget {
  final String title;
  RegisterPage({Key key, this.title}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nam = TextEditingController();
  TextEditingController sur = TextEditingController();
  TextEditingController eml = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register()async{
    var url = "http://192.168.8.145/LOGIN/signup.php";
    var response = await http.post(url, body: {
      "name" : nam.text,
      "surname" : sur.text,
      "email" : eml.text,
      "password" : pass.text,

    });
    print("karyn shamba");
    print(response);

    //var data = jsonDecode(response.body);
    var data =   json.decode(json.encode(response.body));

    if( data == "Sign Up Success"){
     Fluttertoast.showToast(msg: "registered successfully",toastLength: Toast.LENGTH_SHORT);
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);

}/*else {
  Fluttertoast.showToast(
      msg: "Registered Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
  print(data);
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);


}*/

   // Navigator.push(
      //context, MaterialPageRoute(builder: (context) => LoginPage()),);
    //Navigator.pushReplacementNamed(context, '/login');
    //respStatus = "";
    //setState(() { respText = res[2]; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Signup")),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height:60.0),
            Center(
              child: Text(
                  'User Signup',
                  style: TextStyle(
                    fontSize: 36.0,
                    //fontWeight: FontWeight.bold
                  )
              ),
            ),
            SizedBox(height:10.0),
            logStatus(),
            SizedBox(height:2.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nam,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '  First Name ',
                ),
                //troller: nam,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sur,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
                //controller: sur,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: eml,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
                //controller: eml,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                //controller: pass,
              ),
            ),
            SizedBox(height:30.0),
            Container(
              //width: 100.0,
              margin:EdgeInsets.symmetric(horizontal:40.0),
              height: 50,
              child: ElevatedButton(
                child: Text('Register'),
                onPressed: () {
                register();
                  print('Pressed');

                },
              ),
            ),
            SizedBox(height:50.0),
            /*Row(
              children: <Widget>[
                TextButton(
                    child: Text('Login'),
                    onPressed: () {
                      respText = "";
                      Navigator.pushReplacementNamed(
                        context,
                        '/login',
                      );
                      print('Pressed');
                    }
                ),
              ],
            )*/
          ],
        )
    );
  }
}
