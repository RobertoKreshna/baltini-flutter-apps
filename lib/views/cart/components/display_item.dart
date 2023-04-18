import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../checkout/vm/checkout_flow_vm.dart';
import 'item_on_cart.dart';

class CartDisplay extends StatelessWidget {
  const CartDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.products.length,
                itemBuilder: (BuildContext context2, index) {
                  if (index < value.products.length) {
                    return ItemOnCart(value.products[index], index);
                  } else {
                    return Container();
                  }
                }),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'ORDER NOTES',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              controller: value.notes,
              decoration: const InputDecoration(hintText: 'Leave Notes'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '1 CLICK PROTECT',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '(Rp. 325000)',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Instantly resolve shipping issues',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          child: const Text(
                            'LEARN MORE',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
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
              padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 16.0),
              child: Text(
                'All orders are processed in USD at the most recent exchange rate available. Shipping, taxes, and discounts codes calculated at checkout. Please check the box below to agree with our Terms and Conditions.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    side: const BorderSide(
                      color: Color.fromRGBO(201, 207, 210, 1),
                    ),
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                    value: value.agreeTC,
                    onChanged: (currentVal) {
                      value.toggleTC();
                    }),
                const Text('I agree with the'),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'TERMS AND CONDITIONS',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.25))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Subtotal',
                        ),
                        Text(
                          'Rp. ${double.parse(value.totalPrice.toString()).toInt()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
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
                                  Navigator.pushNamed(context, '/checkout');
                                }
                              : () {},
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: value.agreeTC ? Colors.black : Colors.grey,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text(
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
        );
      },
    );
  }
}
