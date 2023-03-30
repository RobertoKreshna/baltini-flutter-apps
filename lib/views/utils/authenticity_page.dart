import 'package:flutter/material.dart';

class Authenticity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/icons/icons_44/ic_back.png'),
                  ),
                  Text(
                    'Authenticity Guarantee',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/Authentic.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'Customer trust is a priority for us at Baltini, which is why we pride ourselves in working with authentic brands you can trust. We guarantee that the items you pay for at Baltini are genuine, authentic, and in the best condition.',
                  style: TextStyle(fontSize: 16, height: 1.7),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
