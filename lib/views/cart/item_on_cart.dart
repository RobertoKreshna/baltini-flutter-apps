import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemOnCart extends StatelessWidget {
  Product current;
  int index;

  ItemOnCart(this.current, this.index);

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<CartVM>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 93,
              child: current.image == 'null'
                  ? Image.asset('assets/images/placeholder.png')
                  : Image.network(current.image),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        current.vendor,
                        style: TextStyle(height: 1.5),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        current.title,
                        style: TextStyle(height: 1.5),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${current.options[1]['values'][value.sizeIndex[index]]}, ${current.options[0]['values'][0]}',
                        style: TextStyle(height: 1.5),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rp. ${current.price}',
                        style: TextStyle(height: 1.5),
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(201, 207, 210, 1),
                                ),
                              ),
                              child: Image.asset(
                                  'assets/icons/icons_24/ic_minus.png'),
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
                            child: Center(
                                child: Text(value.qty[index].toString())),
                          ),
                          GestureDetector(
                            onTap: () {
                              value.addQty(index);
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(201, 207, 210, 1),
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
                      value.deleteProduct(value.products[index]);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        width: 250,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Item deleted from cart.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                value.addProduct(
                                    value.recentlydeleted!,
                                    value.recentlydeletedqty!,
                                    value.recentlydeletedselectedsize!);
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
                    child: Container(
                      height: 44,
                      width: 44,
                      child: Image.asset('assets/icons/icons_44/ic_delete.png'),
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
}
