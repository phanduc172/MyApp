import 'package:flutter/material.dart';

class MyInstagram extends StatelessWidget {
  MyInstagram({Key? key}) : super(key: key);

  final NewsItem firstNewsItem = NewsItem(
    title: 'Tin của bạn',
    avatarUrl: 'assets/images/1.jpg',
  );

  final List<NewsItem> newsItems = [
    NewsItem(
      title: 'phd01',
      avatarUrl: 'assets/images/8.jpg',
    ),
    NewsItem(
      title: 'html02',
      avatarUrl: 'assets/images/3.jpg',
    ),
    NewsItem(
      title: 'mehei56',
      avatarUrl: 'assets/images/4.jpg',
    ),
    NewsItem(
      title: 'mai_dung05',
      avatarUrl: 'assets/images/5.jpg',
    ),
    NewsItem(
      title: '_thanhtin01',
      avatarUrl: 'assets/images/6.jpg',
    ),
    NewsItem(
      title: 'nhatanh_',
      avatarUrl: 'assets/images/7.jpg',
    ),
  ];

  final List<PostItem> posts = [
    PostItem(
      imageUrl: 'assets/images/1.jpg',
      accountName: 'Phan Đức',
    ),
    PostItem(
      imageUrl: 'assets/images/2.jpg',
      accountName: 'Phan Duyên',
    ),
    PostItem(
      imageUrl: 'assets/images/3.jpg',
      accountName: 'Mai Dũng',
    ),
    PostItem(
      imageUrl: 'assets/images/4.jpg',
      accountName: 'Thanh Tín',
    ),
    PostItem(
      imageUrl: 'assets/images/5.jpg',
      accountName: 'Thành Đạt',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Instagram',
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Cookie',
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 30,
              ),
              itemBuilder: (BuildContext context) {
                return {'follow', 'favorites'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(choice == 'follow' ? 'Đang theo dõi' : 'Mục yêu thích',
                              style: TextStyle(
                                fontFamily: 'Pattaya',
                                fontSize: 18
                              ) ,
                            ),
                          ),
                          Icon(
                            choice == 'follow' ? Icons.people_outline_outlined : Icons.star_border_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 85,
              itemCount: newsItems.length,
              itemBuilder: (context, index) {
                if(index==0) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(firstNewsItem.avatarUrl),
                                radius: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            firstNewsItem.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(newsItems[index].avatarUrl),
                            radius: 30,
                          ),
                          SizedBox(
                              height: 10
                          ),
                          Text(
                            newsItems[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(post.imageUrl),
                                  radius: 25,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              SizedBox(width: 10), // Khoảng cách giữa chữ và ảnh
                              Text(
                                post.accountName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Image(
                      image: AssetImage(post.imageUrl),
                      fit: BoxFit.contain,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.favorite_border,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.comment_outlined,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.share,
                            size: 30,
                          ),
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.bookmark_border,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            "170.200 lượt thích",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewsItem {
  final String title;
  final String avatarUrl;

  NewsItem({
    required this.title,
    required this.avatarUrl,
    }
  );
}

class PostItem {
  final String imageUrl;
  final String accountName;

  PostItem({
    required this.imageUrl,
    required this.accountName,
  });
}
