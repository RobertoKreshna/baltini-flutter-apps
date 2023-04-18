import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/forgotpassword/vm/forgot_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
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
                    'Forgot Password',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            Text(
              'We\'ll send link to reset your password to ths email.',
              style: TextStyle(fontSize: 16),
            ),
            Consumer<ForgotVM>(
              builder: (context, value, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: TextField(
                    controller: value.email,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      focusColor: Colors.black,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {},
              child: AccountButton(text: 'SUBMIT', blackBG: true),
            ),
          ],
        ),
      )),
    );
  }
}
