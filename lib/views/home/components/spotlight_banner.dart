import 'package:baltini_flutter_apps/views/product_list/components/sending_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../product_list/vm/list_vm.dart';
import '../service/home_service.dart';
import '../vm/home_vm.dart';

class SpotlightBanner extends StatelessWidget {
  String path;
  String brand;

  SpotlightBanner(this.path, this.brand);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Consumer<HomeVM>(
        builder: (context, value, child) {
          return GestureDetector(
            onTap: () async {
              value.setArgs('brand', brand);
              Navigator.pushNamed(context, '/list',
                  arguments: ListPageArguments(value.argsProducts, false));
            },
            child: AspectRatio(
              aspectRatio: 3.0 / 4.0,
              child: Image.asset(
                '$path',
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
