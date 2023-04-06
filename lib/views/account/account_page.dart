import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/account/components/account_page_tile.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
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
                      ? AccountPageTile(name: 'My Profile')
                      : Container(),
                  vm.userLoggedin
                      ? AccountPageTile(name: 'My Address')
                      : Container(),
                  AccountPageTile(name: 'Baltini Magazine'),
                  AccountPageTile(name: 'About Baltini'),
                  AccountPageTile(name: 'Terms and Condition'),
                  AccountPageTile(name: 'Partnerships'),
                  AccountPageTile(name: 'Helps'),
                  vm.userLoggedin
                      ? GestureDetector(
                          onTap: () {
                            vm.logout();
                          },
                          child: AccountPageTile(
                            name: 'Log Out',
                            image: logout,
                            color: Colors.red,
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 40,
                  ),
                  vm.userLoggedin
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child:
                                      AccountButton('LOGIN TO BALTINI', false)),
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
