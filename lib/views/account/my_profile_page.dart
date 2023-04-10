import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/account/vm/my_profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/const/asset_path.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProfileVM vm = MyProfileVM();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<AccountVM>(
          builder: (context, value, child) {
            vm.firstName.text = value.currentUser!.firstName;
            vm.lastName.text = value.currentUser!.lastName;
            vm.email.text = value.currentUser!.email;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackAndTitle('My Profile', () {
                  Navigator.pop(context);
                }),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'First Name',
                    hinttext: 'Enter your first name here',
                    controller: vm.firstName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'Last Name',
                    hinttext: 'Enter your last name here',
                    controller: vm.lastName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'Email',
                    hinttext: 'Enter your email here',
                    controller: vm.email,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/changepw')
                          .then((value) => Navigator.pop(context));
                    },
                    child: Text(
                      'CHANGE PASSWORD',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    value.updateUser(
                        vm.firstName.text, vm.lastName.text, vm.email.text);
                    Navigator.pop(context);
                  },
                  child: AccountButton('SAVE', true),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
