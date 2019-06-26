import 'package:eshop/models/product-details.model.dart';
import 'package:eshop/repositories/product.repository.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _service = new ProductRepository();

  ProductPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _service.get(tag),
      builder: (context, snapshot) {
        ProductDetailsModel product = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(
                child: Text(snapshot.error),
              );
            return content(product);
        }
        return null; // unreachable
      },
    );
  }

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            width: 200,
            child: Image.network(
              product.images[index],
            ),
          );
        },
      ),
    );
  }
}
