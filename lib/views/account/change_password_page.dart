import 'package:baltini_flutter_apps/utils/components/popup.dart';
import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/utils/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/account/vm/change_password_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/const/asset_path.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordVM vm = ChangePasswordVM();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<AccountVM>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(back)),
                      const Text(
                        'Change Password',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    text: 'Enter your old password here',
                    controller: vm.oldPW,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    text: 'Enter your new password here',
                    controller: vm.newPW,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    text: 'Confirm your new password here',
                    controller: vm.confirmNewPW,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    if (value.currentUser!.password == vm.oldPW.text &&
                        vm.newPW.text == vm.confirmNewPW.text) {
                      value.updatePassword(vm.newPW.text);
                      showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  BaltiniPopUp(title: 'Password Changed'))
                          .then((value) => Navigator.pop(context));
                    } else {}
                  },
                  child: BaltiniButton(text: 'SAVE', blackBG: true),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
