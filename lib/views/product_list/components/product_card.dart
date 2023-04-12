import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/product.dart';

class ProductCard extends StatelessWidget {
  List<Product> products;

  ProductCard(this.products);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.0 / 3.25),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/details',
                  arguments: products[index]);
            },
            child: Container(
              width: 163,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 245,
                      child: products[index].image == 'null'
                          ? Image.asset(placeholder)
                          : Image.network(products[index].image)),
                  SizedBox(
                    height: 4,
                  ),
                  Center(child: Text('${products[index].vendor}')),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${products[index].title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Rp. ${double.parse(products[index].price).toInt()}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          );
        });
  }
}
