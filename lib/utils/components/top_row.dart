import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../views/cart/vm/cart_vm.dart';

class TopRow extends StatelessWidget {
  bool back;
  bool fromSearch;

  TopRow({super.key, required this.back, required this.fromSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        back
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
            : Container(),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
                color: Style.grey, borderRadius: BorderRadius.circular(5.0)),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(search),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Search...',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        fromSearch
            ? Container()
            : Consumer<CartVM>(
                builder: (context, value, child) {
                  return Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: value.products.isEmpty
                              ? Image.asset(cart)
                              : badges.Badge(
                                  position: badges.BadgePosition.bottomEnd(
                                      end: 8, bottom: 0),
                                  badgeContent: Text(
                                    value.products.length.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  child: Image.asset(cart),
                                )));
                },
              ),
      ],
    );
  }
}
