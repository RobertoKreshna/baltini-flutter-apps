class Product {
  String id, title, vendor, product_type, status, image, price, created;
  List variant, options, images;

  Product({
    required this.id,
    required this.title,
    required this.vendor,
    required this.product_type,
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
      product_type: json['product_type'],
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
