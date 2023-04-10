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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(back)),
                      Text(
                        'My Profile',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'First Name',
                    hinttext: 'Enter your first name here',
                    controller: vm.firstName,
                    value: value.currentUser!.firstName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'Last Name',
                    hinttext: 'Enter your last name here',
                    controller: vm.lastName,
                    value: value.currentUser!.lastName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    label: 'Email',
                    hinttext: 'Enter your email here',
                    controller: vm.email,
                    value: value.currentUser!.email,
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
