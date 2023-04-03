import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/models/product.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<CartVM>(builder: (context, value, child) {
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Image.asset('assets/icons/icons_44/ic_back.png'),
                      ),
                    ),
                    Text(
                      'Cart(${value.products.length})',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              value.products.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.products.length,
                            itemBuilder: (BuildContext context2, index) {
                              if (index < value.products.length) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 24.0),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 93,
                                          child: value.products[index].image ==
                                                  'null'
                                              ? Image.asset(
                                                  'assets/images/placeholder.png')
                                              : Image.network(
                                                  value.products[index].image),
                                        ),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    value
                                                        .products[index].vendor,
                                                    style:
                                                        TextStyle(height: 1.5),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    value.products[index].title,
                                                    style:
                                                        TextStyle(height: 1.5),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    '${value.products[index].options[1]['values'][value.sizeIndex[index]]}, ${value.products[index].options[0]['values'][0]}',
                                                    style:
                                                        TextStyle(height: 1.5),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    'Rp. ${value.products[index].price}',
                                                    style:
                                                        TextStyle(height: 1.5),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          value.minQty(index);
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      201,
                                                                      207,
                                                                      210,
                                                                      1),
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                              'assets/icons/icons_24/ic_minus.png'),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 82,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                Color.fromRGBO(
                                                                    201,
                                                                    207,
                                                                    210,
                                                                    1),
                                                          ),
                                                        ),
                                                        child: Center(
                                                            child: Text(value
                                                                .qty[index]
                                                                .toString())),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          value.addQty(index);
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      201,
                                                                      207,
                                                                      210,
                                                                      1),
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                              'assets/icons/icons_24/ic_plus.png'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  value.deleteProduct(
                                                      value.products[index]);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    width: 250,
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Item deleted from cart.",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            value.addProduct(
                                                                value
                                                                    .recentlydeleted,
                                                                value
                                                                    .recentlydeletedqty,
                                                                value
                                                                    .recentlydeletedselectedsize);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .hideCurrentSnackBar();
                                                          },
                                                          child: Text(
                                                            'UNDO',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .hideCurrentSnackBar();
                                                          },
                                                          child: Container(
                                                            height: 20,
                                                            width: 20,
                                                            child: Image.asset(
                                                                'assets/icons/icons_44/ic_close.png'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            232, 236, 238, 1.0),
                                                    elevation: 10, //shadow
                                                  ));
                                                },
                                                child: Container(
                                                  height: 44,
                                                  width: 44,
                                                  child: Image.asset(
                                                      'assets/icons/icons_44/ic_delete.png'),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'ORDER NOTES',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        TextField(
                          controller: value.notes,
                          decoration: InputDecoration(hintText: 'Leave Notes'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '1 CLICK PROTECT',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '(USD 22.00)',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Instantly resolve shipping issues',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        'LEARN MORE',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    )
                                  ]),
                              Switch.adaptive(
                                  value: value.valueClickProtect,
                                  onChanged: (currentVal) {
                                    value.toggleClickProtect();
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 16.0),
                          child: Text(
                            'All orders are processed in USD at the most recent exchange rate available. Shipping, taxes, and discounts codes calculated at checkout. Please check the box below to agree with our Terms and Conditions.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                side: BorderSide(
                                  color: Color.fromRGBO(201, 207, 210, 1),
                                ),
                                activeColor: Colors.black,
                                checkColor: Colors.white,
                                value: value.agreeTC,
                                onChanged: (currentVal) {
                                  value.toggleTC();
                                }),
                            Text('I agree with the'),
                            SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'TERMS AND CONDITIONS',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.25))),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Subtotal',
                                    ),
                                    Text(
                                      'Rp. ${value.totalPrice.toString()}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Text(
                                      'CHECKOUT',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No Product in Cart"),
                      ],
                    ),
            ],
          ));
        }),
      )),
    );
  }
}
