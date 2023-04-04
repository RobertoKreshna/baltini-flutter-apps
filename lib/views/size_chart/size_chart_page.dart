import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/size_chart/vm/size_chart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/chart.dart';

class SizeChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(close),
                  ),
                  Text(
                    'Size Chart',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Size conversions vary per brand and may not fully match the conversions shown below. If you are not sure about your size or if you\'d like the exact measurements, please visit its official website or contact our customer care.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ),
              Consumer<ChartVM>(
                builder: (context, value, child) {
                  return Chart(value);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
