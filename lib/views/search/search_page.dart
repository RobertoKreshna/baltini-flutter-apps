import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:baltini_flutter_apps/views/search/vm/search_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Consumer<SearchVM>(
            builder: (context, vm, child) {
              return Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          vm.controller.clear();
                          Navigator.pop(context);
                        },
                        child: Image.asset(back),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(18, 19, 19, 1.0)),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Consumer<ListVM>(
                              builder: (context, list, child) {
                                return TextField(
                                  controller: vm.controller,
                                  onChanged: (value) {
                                    vm.toggleHistory(false);
                                    vm.searchProduct(value); //matikan
                                  },
                                  onEditingComplete: () {
                                    vm.addToHistory(vm.controller.text);
                                    vm.toggleHistory(true);
                                    vm.controller.clear();
                                    list.setFromSearch(true);
                                    list.setProduct(vm.recommendedItems);
                                    Navigator.pushNamed(context, '/list');
                                  },
                                  decoration: InputDecoration(
                                    icon: Image.asset(
                                      search,
                                    ),
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  vm.showHistory
                      ? Flexible(
                          child: ListView.builder(
                              itemCount: vm.searchHistory.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(vm.searchHistory[index]),
                                );
                              }),
                        )
                      : Flexible(
                          child: Column(
                            children: [
                              Flexible(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: vm.recommendedItems.isEmpty
                                        ? vm.recommendedItems.length
                                        : 4,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index <
                                          (vm.recommendedItems.length)) {
                                        return ListTile(
                                          title: Text(
                                              vm.recommendedItems[index].title),
                                          subtitle: Text(vm
                                              .recommendedItems[index].vendor),
                                        );
                                      }
                                    }),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/list',
                                        arguments: ListVM(
                                            products: vm.recommendedItems,
                                            fromSearch: true));
                                  },
                                  child: Text(
                                    'View All ${vm.recommendedItems.length} Product(s)',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
