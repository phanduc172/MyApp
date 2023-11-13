import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  List<MenuItemBottom> lsMenuItemBottom = [
    MenuItemBottom(label: "Home", iconData: Icons.home, color: Colors.red),
    MenuItemBottom(label: "Profile", iconData: Icons.supervised_user_circle_sharp,color: Colors.blue),
    MenuItemBottom(label: "Logout", iconData: Icons.logout,color: Colors.yellow),
  ];
  List<String> lsTopic = ["Khoa học","Đời sống","Âm nhạc","Võ thuật","Khoa học","Đời sống","Âm nhạc","Võ thuật","Khoa học","Đời sống","Âm nhạc","Võ thuật"];
  String urlImage = "https://images.unsplash.com/photo-1682687220247-9f786e34d472?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80";
  // List<String> listMenuBottom = ["Home","Profile","Logout"];
  // List<IconData> listIcon = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
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
                fontFamily: "Pattaya",
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
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: lsTopic.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(urlImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30)
              ),
              margin: EdgeInsets.all(15)  ,
              height: MediaQuery.of(context).size.height/3,
              child: Stack(
                children: [
                  Positioned(
                    child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.heart_broken,
                          color: Colors.red,
                          size: 30,
                        ),

                    ),
                    top: 10,
                    right: 20,
                  ),
                  Positioned(
                    child: Text(
                      "Hello World",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          shadows: [
                            BoxShadow(
                                color: Colors.black87,
                                blurRadius: 5,
                                offset: Offset(5,5)
                            )
                          ]
                      ),
                    ),
                    bottom: 10,
                    left: 20,
                  ),
                ],
              ),
            ),
            Image(
              image: NetworkImage(urlImage),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Trang chủ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        leading: Icon(
          Icons.home,
          color: Colors.white,
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.search
            ),
          ),
          IconButton(
            onPressed: (){

            },
            icon: Icon(
                Icons.add
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              List<String> dsMenu = ["Thông tin cá nhân","Đổi mật khẩu","Đăng xuất"];
              return dsMenu.map((e) {
                return PopupMenuItem(child: Text(e));
              }).toList();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: lsMenuItemBottom.map((e){
          return BottomNavigationBarItem(
              icon: Icon(
                e.iconData,
                color: e.color,
              ),
              label: e.label,
              backgroundColor: e.color
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
          child: Icon(
            Icons.add
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

class MenuItemBottom {
  late String label;
  late IconData iconData;
  late Color color;
  MenuItemBottom({required this.label, required this.iconData,this.color = Colors.black});
}