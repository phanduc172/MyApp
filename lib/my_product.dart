import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'Model/product.dart';

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  late List<Product> products;
  late ScrollController _scrollController;
  late int maxCurrent;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    products = [];
    _scrollController = ScrollController()..addListener(_onScroll);
    maxCurrent = 6;
    isLoading = false;
    _loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    // Fetch initial data and update the 'products' list
    List<Product> initialData = await Rating.fetchData();
    setState(() {
      products = initialData.take(maxCurrent).toList();
    });
  }

  Future<void> _loadMoreData() async {
    setState(() {
      isLoading = true;
    });

    // Fetch more data and append it to the 'products' list
    List<Product> moreData = await Rating.fetchData();
    setState(() {
      products.addAll(moreData);
      isLoading = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Load more data when the end of the list is reached
      _loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách sản phẩm',
          style: TextStyle(fontFamily: "Pattaya", fontSize: 24),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        leading: Icon(
          Icons.density_medium_rounded,
        ),
      ),
      body: LazyLoadScrollView(
        onEndOfPage: _loadMoreData,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          controller: _scrollController,
          itemCount: products.length + (isLoading ? 1 : 0), // +1 for the loading indicator
          itemBuilder: (context, index) {
            if (index < products.length) {
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        height: 100,
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
            } else {
              // Display the loading indicator when loading more data
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
