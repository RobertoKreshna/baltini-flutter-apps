import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/address/vm/my_address_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/components/popup.dart';

class AddressFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Consumer2<AccountVM, AddressVM>(
              builder: (context, account, value, child) {
                return Column(
                  children: [
                    BackAndTitle('Add Address', () {
                      if (value.editing == true) value.editing = false;
                      Navigator.pop(context);
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'First Name',
                        controller: value.firstname,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'Last Name',
                        controller: value.lastname,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'Company (optional)',
                        controller: value.company,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'Address 1',
                        controller: value.address1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'Address 2',
                        controller: value.address2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'City',
                        controller: value.city,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'Country',
                        controller: value.country,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'State',
                        controller: value.state,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'Zip Code',
                        controller: value.zipcode,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: NonPWTextField(
                        text: 'Phone',
                        controller: value.phone,
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          side: BorderSide(
                            color: Color.fromRGBO(201, 207, 210, 1),
                          ),
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: value.setdefault,
                          onChanged: (currentVal) {
                            value.toggleSetDefault();
                          },
                        ),
                        Text('Set as default address'),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (value.editing == false) {
                          value.addAddress(account.currentUser!);
                          showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      BaltiniPopUp('Address Saved'))
                              .then((value) => Navigator.pop(context));
                        } else {
                          value.updateAddress(account.currentUser!);
                          value.editing = false;
                          showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      BaltiniPopUp('Address Saved'))
                              .then((value) => Navigator.pop(context));
                        }
                      },
                      child: AccountButton('SAVE ADDRESS', true),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
