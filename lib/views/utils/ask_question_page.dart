import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/views/utils/ask_question_components/components.dart';
import 'package:flutter/material.dart';

import '../../utils/const/asset_path.dart';

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
              BackAndTitle('Contact Us', () {
                Navigator.pop(context);
              }),
              SizedBox(
                height: 30,
              ),
              AskQuestionContainer('HEADQUARTERS',
                  '2510 East Sunset Rd, #5-960,\n Las Vegas, NV, 89120'),
              SizedBox(
                height: 16,
              ),
              AskQuestionContainer('GET IN TOUCH WITH US',
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
}
