import 'package:baltini_flutter_apps/utils/components/custom_tile.dart';
import 'package:baltini_flutter_apps/views/category/vm/category_vm.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Consumer2<ListVM, CategoryVM>(
          builder: (context, list, category, child) {
            return Column(
              children: [
                CustomTile(name: 'Designers'),
                GestureDetector(
                  onTap: () async {
                    await category.getProduct();
                    list.setProduct(category.products);
                    list.setFromSearch(false);
                    Navigator.pushNamed(context, '/list');
                  },
                  child: CustomTile(name: 'New Arrivals', image: ''),
                ),
                GestureDetector(
                  onTap: () async {
                    await category.getProduct();
                    list.setProduct(category.products);
                    list.setFromSearch(false);
                    Navigator.pushNamed(context, '/list');
                  },
                  child: CustomTile(name: 'SALE', image: ''),
                ),
                GestureDetector(
                  onTap: () async {
                    await category.getProduct();
                    list.setProduct(category.products);
                    list.setFromSearch(false);
                    Navigator.pushNamed(context, '/list');
                  },
                  child: CustomTile(name: 'Shop All', image: ''),
                ),
                GestureDetector(
                  onTap: () {
                    category.setCurrentCategory('Clothing');
                    Navigator.pushNamed(context, '/specificcategory');
                  },
                  child: CustomTile(name: 'Clothing'),
                ),
                GestureDetector(
                  onTap: () {
                    category.setCurrentCategory('Shoes');
                    Navigator.pushNamed(context, '/specificcategory');
                  },
                  child: CustomTile(name: 'Shoes'),
                ),
                GestureDetector(
                  onTap: () {
                    category.setCurrentCategory('Bags');
                    Navigator.pushNamed(context, '/specificcategory');
                  },
                  child: CustomTile(name: 'Bags'),
                ),
                GestureDetector(
                  onTap: () {
                    category.setCurrentCategory('Accessories');
                    Navigator.pushNamed(context, '/specificcategory');
                  },
                  child: CustomTile(name: 'Accessories'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
