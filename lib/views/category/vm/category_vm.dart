import 'package:baltini_flutter_apps/utils/models/product.dart';
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
}
