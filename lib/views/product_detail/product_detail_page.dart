import 'package:baltini_flutter_apps/utils/components/top_carousel.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:baltini_flutter_apps/views/product_detail/components/product_detail_body.dart';
import 'package:baltini_flutter_apps/views/product_detail/vm/detail_vm.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  Product current;

  ProductDetailPage(this.current);

  @override
  Widget build(BuildContext context) {
    //get all images from product
    List<Image> images = [];
    if (current.images.isNotEmpty) {
      for (int i = 0; i < current.images.length; i++) {
        images.add(Image.network(current.images[i]['src']));
      }
    }
    if (images.isEmpty) {
      images.add(Image.asset(placeholder));
      images.add(Image.asset(placeholder));
      images.add(Image.asset(placeholder));
    }
    //build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Consumer<DetailVM>(
                          builder: (context, value, child) {
                            return GestureDetector(
                              onTap: () {
                                value.selectedSizeIndex = 0;
                                value.imageCurrentIndex = 0;
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Image.asset(back),
                              ),
                            );
                          },
                        ),
                        Container(
                          width: 270,
                          child: Text(
                            '${current.vendor} - ${current.title}',
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Consumer<CartVM>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: value.products.isNotEmpty
                              ? badges.Badge(
                                  badgeContent: Text(
                                    value.products.length.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  position: badges.BadgePosition.bottomEnd(
                                      end: 0, bottom: 0),
                                  child: Image.asset(cart))
                              : Image.asset(cart),
                        );
                      },
                    ),
                  ],
                ),
              ),
              TopCarousel(),
              Consumer<DetailVM>(
                builder: (context, value, child) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      viewportFraction: 0.7,
                      onPageChanged: (index, reason) {
                        value.imageChanged(index);
                      },
                    ),
                    items: images,
                  );
                },
              ),
              Consumer<DetailVM>(
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((e) {
                      int index = images.indexOf(e);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: value.imageCurrentIndex == index
                              ? Color.fromRGBO(0, 0, 0, 1.0)
                              : Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              buildBody(current),
              Consumer2<DetailVM, CartVM>(
                builder: (context, detail, cart, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        cart.addProduct(
                            current, detail.quantity, detail.selectedSizeIndex);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          width: 227,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Item added to cart.",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cart.deleteProduct(current);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                                child: Text(
                                  'UNDO',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(close),
                                ),
                              ),
                            ],
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color.fromRGBO(232, 236, 238, 1.0),
                          elevation: 10, //shadow
                        ));
                      },
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.0),
                              child: Text(
                                'ADD TO CART',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(Product current) {
    List<String> sizes = List.from(current.options[1]['values']);
    int selected = 0;
    return ProductDetailBody(current, sizes, selected);
  }
}
