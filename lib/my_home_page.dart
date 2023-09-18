import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World!",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Xin chào mọi người",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(0,0,0,25),
              decoration: BoxDecoration(
                color: Colors.yellow,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.green,
                    Colors.amberAccent,
                    Colors.blue,
                  ]
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      showToast(context, "Bạn đã nhấn nút Home");
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
                      // Text("Bạn đã nhấn nút Home",style: TextStyle(color: Colors.red),)));
                    },
                    icon: Icon(
                      Icons.home,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showToast(context, "Bạn đã nhấn nút User");
                    },
                    icon: Icon(
                      Icons.account_box,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                     showToast(context, "Bạn đã nhấn nút Share");
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.deepPurple,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showToast(BuildContext context, String data) {
    var snackBar = new SnackBar(
      content: Text(
        data,
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: Duration(microseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}