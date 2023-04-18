import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/utils/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/account/vm/my_profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfilePage extends StatelessWidget {
  MyProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    MyProfileVM vm = MyProfileVM();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<AccountVM>(
          builder: (context, value, child) {
            vm.firstName.text = value.currentUser!.firstName;
            vm.lastName.text = value.currentUser!.lastName;
            vm.email.text = value.currentUser!.email;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackAndTitle(
                    title: 'My Profile',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    text: 'Enter your first name here',
                    controller: vm.firstName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    text: 'Enter your last name here',
                    controller: vm.lastName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: NonPWTextField(
                    text: 'Enter your email here',
                    controller: vm.email,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/changepw')
                          .then((value) => Navigator.pop(context));
                    },
                    child: const Text(
                      'CHANGE PASSWORD',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    value.updateUser(
                        vm.firstName.text, vm.lastName.text, vm.email.text);
                    Navigator.pop(context);
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
