import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/components/custom_tile.dart';
import 'package:baltini_flutter_apps/views/category/vm/category_vm.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecificCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer2<ListVM, CategoryVM>(
          builder: (context, list, value, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  BackAndTitle(value.currentCategory.keys.first, () {
                    Navigator.pop(context);
                  }),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.currentCategory.values.first.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          await value.getProductByType(
                              value.currentCategory.values.first[index]);
                          list.setFromSearch(false);
                          list.setProduct(value.products);
                          Navigator.pushNamed(context, '/list');
                        },
                        child: CustomTile(
                          name: value.currentCategory.values.first[index],
                          image: '',
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
