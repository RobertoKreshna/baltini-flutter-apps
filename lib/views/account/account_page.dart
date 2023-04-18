import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/utils/components/custom_tile.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Consumer<AccountVM>(
            builder: (context, vm, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'My Account',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  vm.userLoggedin
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Hi ${vm.currentUser!.firstName} ${vm.currentUser!.lastName}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        )
                      : Container(),
                  vm.userLoggedin
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: CustomTile(name: 'My Profile'))
                      : Container(),
                  vm.userLoggedin
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/address');
                          },
                          child: CustomTile(name: 'My Address'))
                      : Container(),
                  CustomTile(name: 'Baltini Magazine'),
                  CustomTile(name: 'About Baltini'),
                  CustomTile(name: 'Terms and Condition'),
                  CustomTile(name: 'Partnerships'),
                  CustomTile(name: 'Helps'),
                  vm.userLoggedin
                      ? GestureDetector(
                          onTap: () {
                            vm.logout();
                          },
                          child: CustomTile(
                            name: 'Log Out',
                            image: logout,
                            color: Colors.red,
                          ),
                        )
                      : Container(),
                  const SizedBox(
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
                                  child: AccountButton(
                                      text: 'LOGIN TO BALTINI',
                                      blackBG: false)),
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
