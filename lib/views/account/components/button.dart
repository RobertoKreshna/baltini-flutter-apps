import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  String text;
  double size;
  bool blackBG;

  AccountButton(
      {super.key, required this.text, required this.blackBG, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: blackBG == false
                ? BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  )
                : BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                text,
                style: TextStyle(
                  color: blackBG == false ? Colors.black : Colors.white,
                  fontSize: size,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
