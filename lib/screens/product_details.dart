import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final  String? title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadProduct.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadProduct.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text('\$${loadProduct.price}',style: TextStyle(color: Colors.grey, fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text('${loadProduct.description}', textAlign: TextAlign.center,softWrap: true,),
            )
          ],
        ),
      ),
    );
  }
}
