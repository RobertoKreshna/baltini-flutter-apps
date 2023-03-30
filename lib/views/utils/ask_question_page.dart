import 'package:flutter/material.dart';

class AskQuestion extends StatelessWidget {
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
                    'Contact Us',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              makeContainer('HEADQUARTERS',
                  '2510 East Sunset Rd, #5-960,\n Las Vegas, NV, 89120'),
              SizedBox(
                height: 16,
              ),
              makeContainer('GET IN TOUCH WITH US',
                  'info@baltini.com (General Inquiries)\nreturns@baltini.com (Returns and Refunds)\n+1 (833) 938-1182'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  children: [
                    Text(
                      "Please check our FAQ if you have general questions about our products and services. We might have an answer for you already.",
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Still in need of immediate help regarding your orders and shipping? Kindly reach out to us via any of our contact details above.",
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Alternatively, you can fill out the contact form, and one of our customer support will contact you shortly. Please, note that we are available Monday to Friday, from 10 AM to 5 PM EST, excluding holidays.",
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget makeContainer(String above, String below) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(201, 207, 210, 1.0))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              above,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              below,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
