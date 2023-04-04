import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/product_detail/components/product_detail_description.dart';
import 'package:baltini_flutter_apps/views/product_detail/components/product_detail_links.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/models/product.dart';
import '../vm/detail_vm.dart';

class ProductDetailBody extends StatelessWidget {
  Product current;
  List<String> sizes;
  int selected;

  ProductDetailBody(this.current, this.sizes, this.selected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            current.vendor.toString().toUpperCase(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            current.title,
            style: TextStyle(fontSize: 14),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Rp.${double.parse(current.price)}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'on 4 intereset-free payments of Rp.${double.parse(current.price) / 4.0} with',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 241, 222, 1.0),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'afterpay',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SIZE',
                style: TextStyle(fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/chart');
                },
                child: Text(
                  'SIZE CHART',
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          Consumer<DetailVM>(
            builder: (context, vm, child) {
              return Row(
                children: buildSizeOption(sizes, vm.selectedSizeIndex, vm),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'QUANTITY',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 4,
                ),
                Consumer<DetailVM>(builder: (context, value, child) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          value.decreaseQty();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(201, 207, 210, 1),
                            ),
                          ),
                          child: Image.asset(min),
                        ),
                      ),
                      Container(
                        width: 82,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(201, 207, 210, 1),
                          ),
                        ),
                        child: Center(child: Text(value.quantity.toString())),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.incereaseQty();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(201, 207, 210, 1),
                            ),
                          ),
                          child: Image.asset(plus),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          Text(
            'PRODUCT DETAILS',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Hooded Neck\nFront Zip Closure\nTwo Side Pocket\nUnlined inner\n100% Polyamide\nMade in Italy\nModel is 184 cm tall and wear size 48 IT',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailDesc('Gender', 'Men'),
                ProductDetailDesc('Material', '100% Polyamide'),
                ProductDetailDesc('Color', current.options[0]['values'][0]),
                ProductDetailDesc('Made in', 'IT'),
                ProductDetailDesc('Product ID', current.id.toString())
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 2.0,
            color: Color.fromRGBO(232, 236, 238, 1.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailLink('/shipreturn', 'Shipping & Returns'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 19),
                  child:
                      ProductDetailLink('/authentic', 'Authenticity Guarantee'),
                ),
                ProductDetailLink('/askquestion', 'Ask A Question')
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 2.0,
            color: Color.fromRGBO(232, 236, 238, 1.0),
          ),
        ],
      ),
    );
  }

  List<Widget> buildSizeOption(List<String> sizes, int selected, DetailVM vm) {
    List<Widget> children = [];
    for (int i = 0; i < sizes.length; i++) {
      children.add(GestureDetector(
        onTap: () {
          vm.setSelectedSize(i);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
                color: i == selected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(7.5),
                border: Border.all(color: Color.fromRGBO(201, 207, 210, 1.0))),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                sizes[i],
                style: TextStyle(
                    color: i == selected ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ));
    }
    return children;
  }
}
