import 'package:baltini_flutter_apps/utils/components/popup.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/register_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/components/password_textfield.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<RegisterVM>(
          builder: (context, value, child) {
            return Column(
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
                        'Register',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'First Name',
                    hinttext: 'Enter your first name here',
                    controller: value.firstName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'Last Name',
                    hinttext: 'Enter your last name here',
                    controller: value.lastName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'Email',
                    hinttext: 'Enter your email here',
                    controller: value.email,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: PWTextField(
                    label: 'Password',
                    hinttext: 'Enter your password here',
                    controller: value.pass,
                    isVisible: value.passVisible,
                    onIconTap: value.toggleVisibile,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Consumer<AccountVM>(
                  builder: (context, account, child) {
                    return GestureDetector(
                      onTap: () {
                        bool res = value.addUsertoDB();
                        if (res) {
                          account.setAccount(value.currentUser!, true);
                          value.clearAll();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  BaltiniPopUp('Account Created')).then(
                              (value) => Navigator.pushNamed(context, '/'));
                        }
                      },
                      child: AccountButton('CREATE', true),
                    );
                  },
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
