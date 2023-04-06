import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:hive/hive.dart';

part 'order.g.dart';

@HiveType(typeId: 0)
class Order extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String orderDate;
  @HiveField(2)
  List<Product> products;
  @HiveField(3)
  List<int> qty;
  @HiveField(4)
  String totalPrice;
  @HiveField(5)
  String paymentMethod;
  @HiveField(6)
  String paymentDate;
  @HiveField(7)
  String shippingMethod;
  @HiveField(8)
  String shippingAddress;
  @HiveField(9)
  String billingAddress;

  Order({
    required this.id,
    required this.orderDate,
    required this.products,
    required this.qty,
    required this.totalPrice,
    required this.paymentMethod,
    required this.paymentDate,
    required this.shippingMethod,
    required this.shippingAddress,
    required this.billingAddress,
  });
}
