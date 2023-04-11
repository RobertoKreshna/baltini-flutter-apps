import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:baltini_flutter_apps/views/category/service/category_service.dart';
import 'package:flutter/material.dart';

class CategoryVM extends ChangeNotifier {
  List<Product> products = [];
  Map<String, List> currentCategory = {};

  String gender = 'Women'; //always start in tab bar 0 (women)

  Map<String, Map<String, List<String>>> category = {
    'Men': {
      'Clothing': [
        'Coats & Jackets',
        'Jeans',
        'Pants & Shorts',
        'Shirts',
        'Suits',
        'Sweaters',
        'Swimwear',
        'Topwear'
      ],
      'Shoes': ['Boots', 'Laced Up', 'Loafers', 'Sandals', 'Sneakers'],
      'Bags': [
        'Backpacks',
        'Belt Bags',
        'Other Bags',
        'Shoulder Bags',
        'Totes'
      ],
      'Accessories': [
        'Belts',
        'Eyewear',
        'Hats',
        'Jewelry',
        'Other Accessories',
        'Scarves',
        'Small Leather Goods'
      ]
    },
    'Women': {
      'Clothing': [
        'Coats & Jackets',
        'Dresses',
        'Jumpsuits',
        'Jeans',
        'Lingerie',
        'Pants & Shorts',
        'Shirts',
        'Skirts',
        'Sweaters',
        'Swimwear',
        'Topwear'
      ],
      'Shoes': [
        'Boots',
        'Flats',
        'Heels',
        'Laced Up',
        'Loafers',
        'Pumps',
        'Sandals',
        'Sneakers',
        'Wedges',
      ],
      'Bags': [
        'Backpacks',
        'Belt Bags',
        'Clutches',
        'Handbags',
        'Other Bags',
        'Shoulder Bags',
        'Totes'
      ],
      'Accessories': [
        'Belts',
        'Eyewear',
        'Hats',
        'Jewelry',
        'Scarves & Wraps',
        'Small Leather Goods',
        'Other Accessories'
      ]
    }
  };

  toggleGender() {
    gender == 'Women' ? gender = 'Men' : gender = 'Women';
  }

  setCurrentCategory(String current) {
    currentCategory = {current: category[gender]![current]!};
    notifyListeners();
  }

  getProduct() async {
    var data = await CategoryService().getAllProduct();
    products = data;
    notifyListeners();
  }

  getProductByType(String type) async {
    List<Product> data = await CategoryService().getAllProduct();
    List<Product> res = [];
    for (Product product in data) {
      if (product.productType == type) {
        res.add(product);
      }
    }
    products = res;
    notifyListeners();
  }
}
