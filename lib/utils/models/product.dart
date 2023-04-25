import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String vendor;
  @HiveField(3)
  String productType;
  @HiveField(4)
  String status;
  @HiveField(5)
  String image;
  @HiveField(6)
  String price;
  @HiveField(7)
  String created;
  @HiveField(8)
  List variant;
  @HiveField(9)
  List options;
  @HiveField(10)
  List images;

  Product({
    required this.id,
    required this.title,
    required this.vendor,
    required this.productType,
    required this.status,
    required this.image,
    required this.variant,
    required this.options,
    required this.images,
    required this.price,
    required this.created,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      vendor: json['vendor'],
      productType: json['product_type'],
      image: json['image'] != null ? json['image']['src'] : 'null',
      status: json['status'],
      options: json['options'],
      variant: json['variants'],
      price: json['variants'][0]['price'],
      images: json['images'],
      created: json['created_at'],
    );
  }
}
