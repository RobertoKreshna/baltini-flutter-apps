import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AccountVM, CheckoutFlowVM>(
      builder: (context, account, value, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CONTACT INFORMATION'),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CONTACT',
                    style: TextStyle(fontSize: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: Text(
                      'CHANGE',
                      style: TextStyle(
                          fontSize: 12, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              account.userLoggedin
                  ? Text(
                      account.currentUser!.email,
                      style: TextStyle(fontSize: 14),
                    )
                  : Text(
                      value.email.text,
                      style: TextStyle(fontSize: 14),
                    ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SHIP TO',
                    style: TextStyle(fontSize: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: Text(
                      'CHANGE',
                      style: TextStyle(
                          fontSize: 12, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${value.address1.text}, ${value.address2.text}, ${value.city.text}, ${value.state.text} \n${value.zipcode.text}, ${value.country.text}',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        );
      },
    );
  }
}
