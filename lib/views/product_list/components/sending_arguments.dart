import 'package:baltini_flutter_apps/utils/models/product.dart';

class ListPageArguments {
  List<Product>? prods;
  bool fromSearch;

  ListPageArguments(this.prods, this.fromSearch);
}
