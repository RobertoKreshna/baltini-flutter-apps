import 'package:baltini_flutter_apps/views/cart/components/display_item.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<CartVM>(builder: (context, value, child) {
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/icons/icons_44/ic_back.png'),
                    ),
                    Text(
                      'Cart(${value.products.length})',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              value.products.isNotEmpty
                  ? const CartDisplay()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
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
