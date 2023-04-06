import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/utils/models/user.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/login&register/components/textfield.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/register_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  child: LoginRegisterTextField('First Name',
                      'Enter your first name here', value.firstName, false),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: LoginRegisterTextField('Last Name',
                      'Enter your last name here', value.lastName, false),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: LoginRegisterTextField(
                      'Email', 'Enter your email here', value.email, false),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: LoginRegisterTextField(
                      'Password', 'Enter your password here', value.pass, true),
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
                          account.setAccount(value.getUser(), true);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildSuccessPopUp()).then(
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

  Widget _buildSuccessPopUp() {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        height: 251,
        width: 247,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
            ),
            Container(
              child: Image.asset(success),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Account Created',
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
