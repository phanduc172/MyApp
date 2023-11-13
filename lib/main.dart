import 'package:flutter/material.dart';
import 'package:myapp/my_home_page.dart';
import 'package:myapp/my_class_room.dart';
import 'package:myapp/my_photo.dart';
import 'package:myapp/my_product.dart';
import 'my_instagram.dart';
void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyProducts(),
      // home: MyInstagram(),
      // home: MyClassRoom(),
      // home: MyHomePage(),
      // home: MyAlbum(),

      debugShowCheckedModeBanner: false,
    );
  }
}
