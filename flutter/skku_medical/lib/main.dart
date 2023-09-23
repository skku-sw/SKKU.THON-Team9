import 'package:flutter/material.dart';
import 'QRPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';
import 'package:http/http.dart' as http;
import 'resister.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String data;

  MyHomePage({required this.data});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(widget.data),
        ],
        controller: PageController(
          initialPage: 1,
        ), // 두 번째 페이지를 초기 페이지로 설정
      ),
    );
  }
}
