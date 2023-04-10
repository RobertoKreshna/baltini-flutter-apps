import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/address/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'vm/my_address_vm.dart';

class MyAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer2<AccountVM, AddressVM>(
          builder: (context, account, address, child) {
            return Column(
              children: [
                BackAndTitle('My Address', () {
                  Navigator.pop(context);
                }),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/formaddress');
                  },
                  child: AccountButton('ADD ADDRESS', true),
                ),
                SizedBox(
                  height: 16,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        color: Colors.black,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: account.currentUser!.address.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < account.currentUser!.address.length) {
                      return AddressTile(
                        account.currentUser!.address[index],
                        () {
                          address.deleteAddress(account.currentUser!, index);
                        },
                        index,
                      );
                    }
                  },
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
