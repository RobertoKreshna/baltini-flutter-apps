import 'package:baltini_flutter_apps/utils/service/base_service.dart';
import 'package:dio/dio.dart';

import '../../../utils/models/product.dart';

class HomeService extends BaseService {
  getNewArrivalProduct() async {
    try {
      Response response = await get(
          url:
              'https://baltini-staging.myshopify.com/admin/api/2023-01/products.json?status=active');
      if (response.data['products'] == null) return null;
      List<Product> products = [];
      for (var element in response.data['products']) {
        products.add(Product.fromJson(element));
      }
      return products;
    } on DioError catch (error) {}
  }

  getProductByID(String id) async {
    try {
      Response response = await get(
          url:
              'https://baltini-staging.myshopify.com/admin/api/2023-01/products/$id.json?status=active');
      if (response.data['product'] == null) return null;
      return Product.fromJson(response.data['product']);
    } on DioError catch (error) {}
  }

  getProductByBrand(String brand) async {
    try {
      Response response = await get(
          url:
              'https://baltini-staging.myshopify.com/admin/api/2023-01/products.json?vendor=$brand&status=active');
      if (response.data['products'] == null) return null;
      List<Product> products = [];
      for (var element in response.data['products']) {
        products.add(Product.fromJson(element));
      }
      return products;
    } on DioError catch (error) {}
  }

  getProductByGender(String gender) async {
    try {
      Response response = await get(
          url:
              'https://baltini-staging.myshopify.com/admin/api/2023-01/products.json?gender=$gender&status=active');
      if (response.data['products'] == null) return null;
      List<Product> products = [];
      for (var element in response.data['products']) {
        products.add(Product.fromJson(element));
      }
      return products;
    } on DioError catch (error) {}
  }
}
