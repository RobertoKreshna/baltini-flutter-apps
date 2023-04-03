import 'package:baltini_flutter_apps/utils/style.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/models/product.dart';
import '../../utils/widget.dart';

class ProductList extends StatelessWidget {
  ListVM vm;

  ProductList(this.vm);

  @override
  Widget build(BuildContext context) {
    //pindahkan product dari vm yang dibuat ke vm yang provider
    List<Product> prods = vm.products;
    bool fromSearch = vm.fromSearch;
    vm = Provider.of<ListVM>(context, listen: false);
    vm.products = prods;
    vm.fromSearch = fromSearch;
    //build widget
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Consumer<ListVM>(
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: MyWidget().topRow(context, true, value.fromSearch),
              );
            },
          ),
          MyWidget().topCarousel(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showFilterBottomSheet(context, vm);
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
                        Image.asset('assets/icons/icons_24/ic_filter.png'),
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
                    showSortBottomSheet(context, vm);
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
                        Image.asset('assets/icons/icons_24/ic_sort.png'),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SORT',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Consumer<ListVM>(
                                  builder: (context, value, child) {
                                value.sortBy = vm.sortBy;
                                return Text(
                                  value.sortBy.toUpperCase(),
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                );
                              }),
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
          vm.products.isNotEmpty
              ? Consumer<ListVM>(
                  builder: (context, value, child) =>
                      Flexible(child: makeCard(value.products)))
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/icons_80/ic_empty.png'),
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
        ]),
      ),
    );
  }

  Widget makeCard(List<Product> products) {
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
                          ? Image.asset('assets/images/placeholder.png')
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
                      'Rp. ${double.parse(products[index].price)}',
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

  void showSortBottomSheet(BuildContext context, ListVM vm) {
    String currentSortValue = vm.sortBy;
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 35,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Style.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'SORT PRODUCT',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: vm.sortValue.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RadioListTile(
                            activeColor: Colors.black,
                            title: Text(vm.sortValue[index]),
                            value: vm.sortValue[index],
                            groupValue: currentSortValue,
                            onChanged: (value) {
                              vm.setSortValue(value.toString());
                              Navigator.pop(context);
                            });
                      }),
                ),
              ],
            ),
          );
        });
  }

  void showFilterBottomSheet(BuildContext context, ListVM vm) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 35,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Style.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'FILTER',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: vm.filterType.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(vm.filterType[index]),
                            value: false,
                            onChanged: (value) {});
                      }),
                ),
              ],
            ),
          );
        });
  }
}
