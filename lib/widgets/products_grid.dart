import 'package:flutter/material.dart';
import 'package:myapp/providers/products.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
// import '../providers/product.dart';

class ProductGrid extends StatelessWidget {
  late final bool showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems :productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value:products[index],
        child: ProductItem(
            // products[index].id, 
            // products[index].title, 
            // products[index].imageUrl,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
    );
  }
}
