import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../product_list/vm/list_vm.dart';
import '../vm/home_vm.dart';

class SpotlightBanner extends StatelessWidget {
  String path;
  String brand;

  SpotlightBanner(this.path, this.brand);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Consumer2<HomeVM, ListVM>(
        builder: (context, home, list, child) {
          return GestureDetector(
            onTap: () async {
              home.setArgs('brand', brand);
              list.setFromSearch(false);
              list.setProduct(home.argsProducts!);
              Navigator.pushNamed(context, '/list');
            },
            child: AspectRatio(
              aspectRatio: 3.0 / 4.0,
              child: Image.asset(
                path,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
