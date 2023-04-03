import 'package:baltini_flutter_apps/utils/service/base_service.dart';
import 'package:dio/dio.dart';

import '../../../utils/models/product.dart';

class SearchService extends BaseService {
  getProduct(String searchValue) async {
    try {
      Response response = await get(
          url:
              'https://baltini-staging.myshopify.com/admin/api/2023-01/products.json?status=active');
      if (response.data['products'] == null) return null;
      List<Product> products = [];
      for (var element in response.data['products']) {
        Product x = Product.fromJson(element);
        if (x.title.toString().contains(searchValue)) {
          products.add(x);
        }
      }
      return products;
    } on DioError catch (error) {}
  }
}
