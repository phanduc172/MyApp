import 'package:cached_network_image/cached_network_image.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Model/product.dart';

class MyProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách sản phẩm',style: TextStyle(fontFamily: "Pattaya",fontSize: 24),),
        backgroundColor: Colors.deepOrangeAccent,
        leading: Icon(
          Icons.density_medium_rounded,
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: Rating.fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
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
            return ProductList(products: data);
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

class ProductList extends StatelessWidget {
  final List<Product> products;
  ProductList({
    required this.products
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children:[
              Padding(
                padding: EdgeInsets.only(top: 16,bottom: 16),
                child: CachedNetworkImage(
                  imageUrl: product.image,height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(product.title),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('\$${product.price.toStringAsFixed(2)}'),
              ),
              Text('Rating: ${product.rating.rate} (${product.rating.count} ratings)'),
            ],
          ),
        );
      },
    );
  }

}