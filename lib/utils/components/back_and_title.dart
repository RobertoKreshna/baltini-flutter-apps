import 'package:flutter/material.dart';

import '../const/asset_path.dart';

class BackAndTitle extends StatelessWidget {
  Function onPressed;
  String title;

  BackAndTitle({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                onPressed();
              },
              child: Image.asset(back)),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
