import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/components/password_textfield.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<LoginVM>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(back)),
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                Text(
                  'Login with your email address and password.',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: NonPWTextField(
                    label: 'EMAIL',
                    hinttext: 'Enter your email address here',
                    controller: value.email,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: PWTextField(
                    label: 'PASSWORD',
                    hinttext: 'Enter your password here',
                    controller: value.pass,
                    isVisible: value.passVisible,
                    onIconTap: value.toggleVisibile,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotpassword');
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.0),
                        child: Text(
                          'FORGOT PASSWORD',
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<AccountVM>(
                  builder: (context, account, child) {
                    return GestureDetector(
                      onTap: () {
                        if (value.checkLogin()) {
                          account.setAccount(value.getUser()!, true);
                          value.clearAll();
                          Navigator.pushNamed(context, '/');
                        } else {
                          print('wrong credentials');
                        }
                      },
                      child: AccountButton('LOGIN', true),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('or')],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: AccountButton('CREATE BALTINI ACCOUNT', false),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
