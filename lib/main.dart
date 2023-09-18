import 'package:flutter/material.dart';
import 'package:myapp/my_home_page.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Nhóm 3",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}