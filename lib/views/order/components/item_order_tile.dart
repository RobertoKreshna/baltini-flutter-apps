import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderTile extends StatelessWidget {
  int index;

  OrderTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVM>(
      builder: (context, value, child) {
        return Container();
      },
    );
  }
}
