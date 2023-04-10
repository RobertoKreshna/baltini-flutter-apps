import 'package:flutter/material.dart';

import '../const/asset_path.dart';

class BaltiniPopUp extends StatelessWidget {
  String title;

  BaltiniPopUp(this.title);

  @override
  Widget build(BuildContext context) {
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
              title,
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
