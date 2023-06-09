import 'package:baltini_flutter_apps/utils/components/popup.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/utils/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/register_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/components/password_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<RegisterVM>(
          builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(back)),
                      const Text(
                        'Register',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                NonPWTextField(
                  text: 'Enter your first name here',
                  controller: value.firstName,
                ),
                NonPWTextField(
                  text: 'Enter your last name here',
                  controller: value.lastName,
                ),
                NonPWTextField(
                  text: 'Enter your email here',
                  controller: value.email,
                ),
                PWTextField(
                  label: 'Password',
                  hinttext: 'Enter your password here',
                  controller: value.pass,
                  isVisible: value.passVisible,
                  onIconTap: value.toggleVisibile,
                ),
                const SizedBox(
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
                                  BaltiniPopUp(title: 'Account Created')).then(
                              (value) => Navigator.pushNamed(context, '/'));
                        }
                      },
                      child: BaltiniButton(text: 'CREATE', blackBG: true),
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
