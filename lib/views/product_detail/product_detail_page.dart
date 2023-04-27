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
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailVM>(
      builder: (context, value, child) {
        List<Image> images = [];
        if (value.current!.images.isNotEmpty) {
          for (int i = 0; i < value.current!.images.length; i++) {
            images.add(Image.network(value.current!.images[i]['src']));
          }
        }
        if (images.isEmpty) {
          images.add(Image.asset(placeholder));
          images.add(Image.asset(placeholder));
          images.add(Image.asset(placeholder));
        }
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                value.selectedSizeIndex = 0;
                                value.imageCurrentIndex = 0;
                                value.disposeProduct();
                                Navigator.pop(context);
                              },
                              child: Image.asset(back),
                            ),
                            Container(
                              width: 270,
                              child: Text(
                                '${value.current!.vendor} - ${value.current!.title}',
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Consumer<CartVM>(
                          builder: (context, carts, child) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                              child: carts.products.isNotEmpty
                                  ? badges.Badge(
                                      badgeContent: Text(
                                        carts.products.length.toString(),
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
                  buildBody(value.current!),
                  Consumer<CartVM>(
                    builder: (context, cart, child) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            cart.addProduct(value.current!, value.quantity,
                                value.selectedSizeIndex);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              width: 227,
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Item added to cart.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cart.deleteProduct(value.current!);
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
                              backgroundColor:
                                  Color.fromRGBO(232, 236, 238, 1.0),
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
      },
    );
  }

  Widget buildBody(Product current) {
    List<String> sizes = List.from(current.options[1]['values']);
    int selected = 0;
    return ProductDetailBody(current, sizes, selected);
  }
}
