import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:flutter/material.dart';

import '../service/home_service.dart';

class NewArrival extends StatelessWidget {
  HomeVM vm;

  NewArrival(this.vm);

  @override
  Widget build(BuildContext context) {
    return vm.homeproducts.isEmpty
        ? Column()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    displayRow(
                      context: context,
                      id1: vm.homeproducts[0].id,
                      id2: vm.homeproducts[1].id,
                      path1: vm.homeproducts[0].image,
                      path2: vm.homeproducts[1].image,
                      brand1: vm.homeproducts[0].vendor,
                      brand2: vm.homeproducts[1].vendor,
                      name1: vm.homeproducts[0].title,
                      name2: vm.homeproducts[1].title,
                      price1: 'Rp.${vm.homeproducts[0].price}',
                      price2: 'Rp.${vm.homeproducts[1].price}',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    displayRow(
                      context: context,
                      id1: vm.homeproducts[2].id,
                      id2: vm.homeproducts[3].id,
                      path1: vm.homeproducts[2].image,
                      path2: vm.homeproducts[3].image,
                      brand1: vm.homeproducts[2].vendor,
                      brand2: vm.homeproducts[3].vendor,
                      name1: vm.homeproducts[2].title,
                      name2: vm.homeproducts[3].title,
                      price1: 'Rp.${vm.homeproducts[2].price}',
                      price2: 'Rp.${vm.homeproducts[3].price}',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    displayRow(
                      context: context,
                      id1: vm.homeproducts[4].id,
                      id2: vm.homeproducts[5].id,
                      path1: vm.homeproducts[4].image,
                      path2: vm.homeproducts[5].image,
                      brand1: vm.homeproducts[4].vendor,
                      brand2: vm.homeproducts[5].vendor,
                      name1: vm.homeproducts[4].title,
                      name2: vm.homeproducts[5].title,
                      price1: 'Rp.${vm.homeproducts[4].price}',
                      price2: 'Rp.${vm.homeproducts[5].price}',
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
      child: SizedBox(
        width: 163,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 245,
                child: Image.asset('assets/images/placeholder.png')),
            SizedBox(
              height: 4,
            ),
            Center(child: Text(brand)),
            SizedBox(
              height: 4,
            ),
            Text(
              name,
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
                        price,
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
                        disc,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      price,
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
}
