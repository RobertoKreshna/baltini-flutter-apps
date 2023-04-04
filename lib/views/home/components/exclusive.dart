import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:baltini_flutter_apps/views/product_list/components/sending_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Exclusive extends StatelessWidget {
  String path, brand, desc;

  Exclusive(this.path, this.brand, this.desc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3.0 / 4.0,
            child: Image.asset(
              '$path',
              fit: BoxFit.fitWidth,
            ),
          ),
          Consumer<HomeVM>(
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 8.0),
                child: GestureDetector(
                  onTap: () async {
                    value.setArgs('brand', brand);
                    Navigator.pushNamed(context, '/list',
                        arguments:
                            ListPageArguments(value.argsProducts, false));
                  },
                  child: Text(
                    '$brand'.toUpperCase(),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              );
            },
          ),
          Container(
            width: 343,
            child: Text(
              '$desc',
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(18, 19, 19, 0.5)),
            ),
          )
        ],
      ),
    );
  }
}
