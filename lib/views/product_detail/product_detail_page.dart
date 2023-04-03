import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:baltini_flutter_apps/utils/widget.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:baltini_flutter_apps/views/product_detail/vm/detail_vm.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  Product current;

  ProductDetail(this.current);

  @override
  Widget build(BuildContext context) {
    //get all images from product
    List<Image> images = [];
    if (current.images.length != 0) {
      for (int i = 0; i < current.images.length; i++) {
        images.add(Image.network(current.images[i]['src']));
      }
    }
    if (images.isEmpty) {
      images.add(Image.asset('assets/images/placeholder.png'));
      images.add(Image.asset('assets/images/placeholder.png'));
      images.add(Image.asset('assets/images/placeholder.png'));
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
                                child: Image.asset(
                                    'assets/icons/icons_44/ic_back.png'),
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
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icons/icons_44/ic_cart.png'),
                    ),
                  ],
                ),
              ),
              MyWidget().topCarousel(),
              Consumer<DetailVM>(
                builder: (context, value, child) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      viewportFraction: 0.7,
                      onPageChanged: (index, reason) {
                        value.ImageChanged(index);
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
              buildBody(context, current),
              Consumer2<DetailVM, CartVM>(
                builder: (context, detail, cart, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        cart.addProduct(current, detail.quantity);
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
                                  height: 16,
                                  width: 16,
                                  child: Image.asset(
                                      'assets/icons/icons_44/ic_close.png'),
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

  Widget buildBody(BuildContext context, Product current) {
    DetailVM vm = DetailVM();
    List<String> sizes = List.from(current.options[1]['values']);
    int selected = 0;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            current.vendor.toString().toUpperCase(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            current.title,
            style: TextStyle(fontSize: 14),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Rp.${double.parse(current.price)}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'on 4 intereset-free payments of Rp.${double.parse(current.price) / 4.0} with',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 241, 222, 1.0),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'afterpay',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SIZE',
                style: TextStyle(fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/chart');
                },
                child: Text(
                  'SIZE CHART',
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          Consumer<DetailVM>(
            builder: (context, vm, child) {
              return Row(
                children: buildSizeOption(sizes, vm.selectedSizeIndex, vm),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'QUANTITY',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 4,
                ),
                Consumer<DetailVM>(builder: (context, value, child) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          value.decreaseQty();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(201, 207, 210, 1),
                            ),
                          ),
                          child:
                              Image.asset('assets/icons/icons_24/ic_minus.png'),
                        ),
                      ),
                      Container(
                        width: 82,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(201, 207, 210, 1),
                          ),
                        ),
                        child: Center(child: Text(value.quantity.toString())),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.incereaseQty();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(201, 207, 210, 1),
                            ),
                          ),
                          child:
                              Image.asset('assets/icons/icons_24/ic_plus.png'),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          Text(
            'PRODUCT DETAILS',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Hooded Neck\nFront Zip Closure\nTwo Side Pocket\nUnlined inner\n100% Polyamide\nMade in Italy\nModel is 184 cm tall and wear size 48 IT',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getDetails('Gender', 'Men'),
                getDetails('Material', '100% Polyamide'),
                getDetails('Color', current.options[0]['values'][0]),
                getDetails('Made in', 'IT'),
                getDetails('Product ID', current.id.toString())
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 2.0,
            color: Color.fromRGBO(232, 236, 238, 1.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/shipreturn');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping & Returns'),
                      Image.asset('assets/icons/icons_24/ic_cevron_right.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 19),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/authentic');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Authenticity Guarantee'),
                        Image.asset(
                            'assets/icons/icons_24/ic_cevron_right.png'),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/askquestion');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ask A Question'),
                      Image.asset('assets/icons/icons_24/ic_cevron_right.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 2.0,
            color: Color.fromRGBO(232, 236, 238, 1.0),
          ),
        ],
      ),
    );
  }

  Widget getDetails(String key, String value) {
    return Row(
      children: [
        Text(
          '$key : ',
          style:
              TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w600),
        ),
        Text(
          '$value',
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  List<Widget> buildSizeOption(List<String> sizes, int selected, DetailVM vm) {
    List<Widget> children = [];
    for (int i = 0; i < sizes.length; i++) {
      children.add(GestureDetector(
        onTap: () {
          vm.setSelectedSize(i);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
                color: i == selected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(7.5),
                border: Border.all(color: Color.fromRGBO(201, 207, 210, 1.0))),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                sizes[i],
                style: TextStyle(
                    color: i == selected ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ));
    }
    return children;
  }
}
