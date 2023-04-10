import 'package:flutter/material.dart';

import '../const/asset_path.dart';

class BackAndTitle extends StatelessWidget {
  Function onPressed;
  String title;

  BackAndTitle(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                onPressed();
              },
              child: Image.asset(back)),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
