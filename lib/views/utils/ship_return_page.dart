import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:flutter/material.dart';

class ShipReturn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              BackAndTitle(
                  title: 'Shipping & Returns',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
