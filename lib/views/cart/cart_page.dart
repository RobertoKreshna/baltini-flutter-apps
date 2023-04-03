import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Consumer<CartVM>(builder: (context, value, child) {
            return Column(
              children: [
                Row(
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
              ],
            );
          }),
        )),
      ),
    );
  }
}
