import 'package:baltini_flutter_apps/views/cart/item_on_cart.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
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
                                return ItemOnCart(value.products[index], index);
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
                                      'Rp. ${double.parse(value.totalPrice.toString()).toInt()}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Consumer<CheckoutFlowVM>(
                                builder: (context, checkout, child) {
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: value.agreeTC
                                          ? () {
                                              checkout.setProductQtyProtect(
                                                  value.products,
                                                  value.qty,
                                                  value.sizeIndex,
                                                  value.valueClickProtect);
                                              Navigator.pushNamed(
                                                  context, '/checkout');
                                            }
                                          : () {},
                                      child: Container(
                                        padding: EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          color: value.agreeTC
                                              ? Colors.black
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Text(
                                          'CHECKOUT',
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
