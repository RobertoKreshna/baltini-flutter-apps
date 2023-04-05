import 'package:baltini_flutter_apps/views/account/components/account_page_tile.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Consumer<AccountVM>(
            builder: (context, vm, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      'My Account',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  vm.userLoggedin
                      ? AccountPageTile('', 'My Profile')
                      : Container(),
                  vm.userLoggedin
                      ? AccountPageTile('', 'My Address')
                      : Container(),
                  AccountPageTile('', 'Baltini Magazine'),
                  AccountPageTile('', 'About Baltini'),
                  AccountPageTile('', 'Terms and Condition'),
                  AccountPageTile('', 'Partnerships'),
                  AccountPageTile('', 'Helps'),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'Login to Baltini'.toUpperCase(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
