import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  String text;
  bool blackBG;

  AccountButton(this.text, this.blackBG);

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
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                text,
                style: TextStyle(
                    color: blackBG == false ? Colors.black : Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
