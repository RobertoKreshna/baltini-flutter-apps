import 'package:flutter/material.dart';

import '../const/asset_path.dart';

class BaltiniPopUp extends StatelessWidget {
  String title;

  BaltiniPopUp({super.key, required this.title});

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
            const SizedBox(
              height: 24,
            ),
            Image.asset(success),
            const SizedBox(
              height: 40,
            ),
            Text(
              title,
              maxLines: 1,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
