library product_list;

import 'package:baltini_flutter_apps/utils/components/top_carousel.dart';
import 'package:baltini_flutter_apps/utils/components/top_row.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/utils/style.dart';
import 'package:baltini_flutter_apps/views/product_list/components/product_card.dart';
import 'package:baltini_flutter_apps/views/product_list/components/sending_arguments.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/models/product.dart';

part 'components/sort_sheet.dart';
part 'components/filter_sheet.dart';

class ProductListPage extends StatelessWidget {
  ListPageArguments args;

  ProductListPage(this.args);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<ListVM>(context, listen: false).products.isEmpty) {
      Provider.of<ListVM>(context, listen: false).setProduct(args.prods!);
    }
    Provider.of<ListVM>(context, listen: false).setFromSearch(args.fromSearch);
    return Scaffold(
      body: SafeArea(
        child: Consumer<ListVM>(
          builder: (context, value, child) {
            return Column(children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TopRow(true, value.fromSearch),
              ),
              TopCarousel(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showFilterBottomSheet(context, value);
                      },
                      child: Container(
                        width: 163,
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Image.asset(filter),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'FILTER',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    GestureDetector(
                      onTap: () {
                        showSortBottomSheet(context, value);
                      },
                      child: Container(
                        width: 163,
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(sort),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SORT',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    value.sortBy.toUpperCase(),
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              value.products.isNotEmpty
                  ? Consumer<ListVM>(
                      builder: (context, value, child) =>
                          Flexible(child: ProductCart(value.products)))
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(empty),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            'No item found.\nTry again with another filter or keyword.',
                            style: TextStyle(
                              color: Color.fromRGBO(18, 19, 19, 1.0),
                              fontSize: 14,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
            ]);
          },
        ),
      ),
    );
  }
}
