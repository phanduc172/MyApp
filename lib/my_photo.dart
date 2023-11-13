import 'package:flutter/material.dart';
import 'package:myapp/Model/photo.dart';

class MyAlbum extends StatelessWidget {
  const MyAlbum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: Photo.fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Lỗi: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            return MyPhoto(lsPhoto: data);
          } else {
            return Center(
              child: Text("Dữ liệu không tồn tại!"),
            );
          }
        },
      ),
    );
  }
}

class MyPhoto extends StatelessWidget {
  MyPhoto({Key? key, required this.lsPhoto}) : super(key: key);
  final List<Photo> lsPhoto;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: lsPhoto.length,
      itemBuilder: (BuildContext context, int index) {
        var photo = lsPhoto[index];
        return Card(
          child: Column(
            children: [
              Text("Album ID: ${photo.albumId}"),
              Text("ID: ${photo.id}"),
              Text("Title: ${photo.title}"),
              Image.network(
                photo.url,
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }
}


