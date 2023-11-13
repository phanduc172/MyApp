import 'dart:convert';
import 'package:http/http.dart' as http;

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json["albumId"] as int,
      id: json["id"] as int,
      title: json["title"] as String,
      url: json["url"] as String,
      thumbnailUrl: json["thumbnailUrl"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };

  static Future<List<Photo>> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/photos';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var content = response.body;
      var jsonList = jsonDecode(content) as List;
      var photos = jsonList.map((e) => Photo.fromJson(e)).toList();
      return photos;
    } else {
      throw Exception("Lỗi khi tải ảnh");
    }
  }
}
