import 'package:flutter/material.dart';
import 'my_header_drawer.dart';

class MyClassRoom extends StatelessWidget {
  MyClassRoom({Key? key}) : super(key: key);

  List<String> listClass = ["Khoa học","Đời sống","Âm nhạc","Võ thuật","Khoa học","Đời sống","Âm nhạc","Võ thuật","Khoa học","Đời sống","Âm nhạc","Võ thuật"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Google Lớp học",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(
            onPressed: (){
            },
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.black54,
            ),
          ),
          PopupMenuButton(
            color: Colors.white,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) {
                List<String> dsMenu = ["Làm mới","Gửi ý kiến phản hồi Google"];
                return dsMenu.map((e) {
                  return PopupMenuItem(child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  );
                }).toList();
              }
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: listClass.map((e) {
                  return Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.fromLTRB(30,15,30,10),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        shadowColor: Colors.black54,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawList(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawList(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text('Màn hình chính'),
          onTap: () {
            // Mở lại Drawer
            Scaffold.of(context).openDrawer();
          },
        ),
        ListTile(
          leading: Icon(
            Icons.calendar_today,
            color: Colors.black,
          ),
          title: Text('Lịch'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(
            Icons.notifications_active_outlined,
            color: Colors.black,
          ),
          title: Text('Thông báo'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Divider(),
        Text(
          "Đã đăng ký",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
          )
        ),
        ListTile(
          leading: Icon(
            Icons.assignment_rounded,
            color: Colors.black,
          ),
          title: Text('Việc cần làm'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }






}


