import 'package:baltini_flutter_apps/utils/models/address.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/address/vm/my_address_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/const/asset_path.dart';

class AddressTile extends StatelessWidget {
  Address current;
  Function onDeleteTap;
  int index;

  AddressTile(this.current, this.onDeleteTap, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(current.name),
              GestureDetector(
                onTap: () {
                  onDeleteTap();
                },
                child: Container(
                  child: Image.asset(delete),
                ),
              ),
            ],
          ),
          Text(
            '${current.address}, ${current.city}, ${current.state}, ${current.country}',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Consumer<AddressVM>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.setEdit(current);
                    value.editing = true;
                    Navigator.pushNamed(context, '/formaddress');
                  },
                  child: AccountButton('EDIT', false),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
