import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AccountVM, CheckoutFlowVM>(
      builder: (context, value, checkout, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CONTACT INFORMATION'),
            SizedBox(
              height: 16,
            ),
            value.userLoggedin
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${value.currentUser!.firstName} ${value.currentUser!.lastName} (${value.currentUser!.email})'),
                        Row(
                          children: [
                            Checkbox(
                              side: BorderSide(
                                color: Color.fromRGBO(201, 207, 210, 1),
                              ),
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                              value: checkout.wantedtoEmail,
                              onChanged: (currentVal) {
                                checkout.toggleEmail();
                              },
                            ),
                            Text('Email me with news and offers'),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('already have an account?'),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        NonPWTextField(
                            text: 'Email', controller: checkout.email),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              side: BorderSide(
                                color: Color.fromRGBO(201, 207, 210, 1),
                              ),
                              activeColor: Colors.black,
                              checkColor: Colors.white,
                              value: checkout.wantedtoEmail,
                              onChanged: (currentVal) {
                                checkout.toggleEmail();
                              },
                            ),
                            Text('Email me with news and offers'),
                          ],
                        )
                      ],
                    ),
                  ),
          ],
        );
      },
    );
  }
}
