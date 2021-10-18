//import 'package:flutter/material.dart';
import 'Attributes.dart';
import 'dart:async';
import 'dart:convert';
//import '../Elements/Product.dart';
import 'package:http/http.dart' as http;
//import '../Views/ProductView.dart';

//Future<List<dynamic>> dbProducts = fetchDBProducts('@init');

Future<dynamic> onQutracePostem(String aName, int ez, Map<dynamic,dynamic> aInEle, dynamic aCondition) async {
  int formEditID = 0;
  print('Now calling on.qutrace.com ');
  //String url = "on.qutrace.com";
  String url = "192.168.8.145/Login"; //http://192.168.8.145/LOGIN/
  final response = await http.post(
    Uri.https(url, 'login.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'ea': 1,
      'ez': ez,
      "fc": "pf",
      "pe": "0",
      "mr": "0",
      'sc': 'mobapp',
      'ap': '2',
      'pt': 'postem',
      'pn': aName,
      'fv': formEditID,
      'dm': '',
      'cl': 0,
      'sm': 0,
      'cn': aCondition,
      'i': aInEle,
      't': '',
      'qta':qQuTraceAuth
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Custome Error: Unable to fetch url from the Qutrace');
  }

  print(response.body);
  final parsed = jsonDecode(response.body);

  if(aName == 'MobChat'){
    print(parsed);
    return parsed;
  }
  print(parsed['JSONData']);
  return parsed['JSONData'];
}

Future<dynamic> onQutraceCaller(String aPostType, String aName, dynamic aValue, Map<dynamic,dynamic> aInEle, dynamic aCondition) async {

  print('Now calling on.qutrace.com');
  //String url = "on.qutrace.com";
  String url = "192.168.8.145/Login";
  final response = await http.post(
    Uri.https(url, 'signup.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'pt': aPostType,
      'pn': aName,//
      'fv': aValue,
      'cn': aCondition,
      'ou': aInEle,//
      'qta': qQuTraceAuth
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Custome Error: Unable to fetch url from the Qutrace');
  }

  print(response.body);
  final parsed = jsonDecode(response.body);

  if(aName == 'MobChat'){
    print(parsed);
    return parsed;
  }
  switch(aPostType){
    case 'MobChat': return parsed;
      break;
  }
  print(parsed['JSONData']);
  return parsed['JSONData'];
}


/*List<Product> fetchAllProducts() {
  List<Product> _listProducts;
  Future<List<Product>> listFuture;
  listFuture = fetchProducts();
  listFuture.then((value) {
    if (value != null) value.forEach((item) => _listProducts.add(item));
  });
  return _listProducts == null ? [] : _listProducts;
}*/
