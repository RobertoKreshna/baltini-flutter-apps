import 'package:baltini_flutter_apps/utils/components/custom_tile.dart';
import 'package:baltini_flutter_apps/views/category/vm/category_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Consumer<CategoryVM>(
          builder: (context, value, child) {
            return Column(
              children: [
                CustomTile(name: 'Designers'),
                CustomTile(name: 'New Arrivals', image: ''),
                CustomTile(name: 'SALE', image: ''),
                CustomTile(name: 'Shop All', image: ''),
                GestureDetector(
                  onTap: () {
                    value.setCurrentCategory('Clothing');
                    Navigator.pushNamed(context, '/specificcategory');
                  },
                  child: CustomTile(name: 'Clothing'),
                ),
                GestureDetector(
                  onTap: () {
                    value.setCurrentCategory('Shoes');
                    Navigator.pushNamed(context, '/specificcategory');
                  },
                  child: CustomTile(name: 'Shoes'),
                ),
                GestureDetector(
                  onTap: () {
                    value.setCurrentCategory('Bags');
                    Navigator.pushNamed(context, '/specificcategory');
                  },
                  child: CustomTile(name: 'Bags'),
                ),
                GestureDetector(
                  onTap: () {
                    value.setCurrentCategory('Accessories');
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
