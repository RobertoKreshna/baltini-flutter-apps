import 'package:baltini_flutter_apps/views/home/service/home_service.dart';
import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/models/product.dart';
import '../../utils/style.dart';

class HomeWidget {
  Widget spotlightBanner(BuildContext context, String path, String brand) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          Navigator.pushNamed(context, '/list',
              arguments: ListVM(
                  products: await HomeService().getProductByBrand(brand)));
        },
        child: AspectRatio(
          aspectRatio: 3.0 / 4.0,
          child: Image.asset(
            '$path',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget newArrival(BuildContext context, HomeVM vm) {
    return vm.products.isEmpty
        ? Column()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    displayRow(
                      context: context,
                      id1: '${vm.products[0].id}',
                      id2: '${vm.products[1].id}',
                      path1: '${vm.products[0].image}',
                      path2: '${vm.products[1].image}',
                      brand1: '${vm.products[0].vendor}',
                      brand2: '${vm.products[1].vendor}',
                      name1: '${vm.products[0].title}',
                      name2: '${vm.products[1].title}',
                      price1: 'Rp.${vm.products[0].price}',
                      price2: 'Rp.${vm.products[1].price}',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    displayRow(
                      context: context,
                      id1: '${vm.products[2].id}',
                      id2: '${vm.products[3].id}',
                      path1: '${vm.products[2].image}',
                      path2: '${vm.products[3].image}',
                      brand1: '${vm.products[2].vendor}',
                      brand2: '${vm.products[3].vendor}',
                      name1: '${vm.products[2].title}',
                      name2: '${vm.products[3].title}',
                      price1: 'Rp.${vm.products[2].price}',
                      price2: 'Rp.${vm.products[3].price}',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    displayRow(
                      context: context,
                      id1: '${vm.products[4].id}',
                      id2: '${vm.products[5].id}',
                      path1: '${vm.products[4].image}',
                      path2: '${vm.products[5].image}',
                      brand1: '${vm.products[4].vendor}',
                      brand2: '${vm.products[5].vendor}',
                      name1: '${vm.products[4].title}',
                      name2: '${vm.products[5].title}',
                      price1: 'Rp.${vm.products[4].price}',
                      price2: 'Rp.${vm.products[5].price}',
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Widget displayRow({
    required BuildContext context,
    required String id1,
    required String id2,
    required String path1,
    required String path2,
    required String brand1,
    required String brand2,
    required String name1,
    required String name2,
    required String price1,
    required String price2,
    String disc1 = '0',
    String disc2 = '0',
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowItem(context, path1, brand1, name1, price1, disc1, id1),
        SizedBox(
          width: 17,
        ),
        rowItem(context, path2, brand2, name2, price2, disc2, id2),
      ],
    );
  }

  Widget rowItem(BuildContext context, String path, String brand, String name,
      String price, String disc, String id) {
    return GestureDetector(
      onTap: () async {
        var product = await HomeService().getProductByID(id);
        Navigator.pushNamed(context, '/details', arguments: product);
      },
      child: Container(
        width: 163,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 245,
                child: Image.asset('assets/images/placeholder.png')),
            SizedBox(
              height: 4,
            ),
            Center(child: Text('$brand')),
            SizedBox(
              height: 4,
            ),
            Text(
              '$name',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(
              height: 8,
            ),
            disc != '0'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$price',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$disc',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      '$price',
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
  }

  Widget exclusive(
      BuildContext context, String path, String brand, String desc) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3.0 / 4.0,
            child: Image.asset(
              '$path',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
            child: GestureDetector(
              onTap: () async {
                Navigator.pushNamed(context, '/list',
                    arguments: ListVM(
                        products:
                            await HomeService().getProductByBrand(brand)));
              },
              child: Text(
                '$brand'.toUpperCase(),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Container(
            width: 343,
            child: Text(
              '$desc',
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(18, 19, 19, 0.5)),
            ),
          )
        ],
      ),
    );
  }
}
