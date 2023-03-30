import 'package:baltini_flutter_apps/views/size_chart/vm/size_chart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeChart extends StatelessWidget {
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
                    child: Image.asset('assets/icons/icons_44/ic_close.png'),
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
                  return buildChart(context, value);
                },
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget buildChart(BuildContext context, ChartVM vm) {
    return Column(
      children: [
        buildChartItem('Clothing', vm.clothingVisible, vm, vm.clothingChart),
        buildChartItem('Jeans', vm.jeansVisible, vm, vm.testTable),
        buildChartItem('Shoes', vm.shoesVisible, vm, vm.testTable),
        buildChartItem('Hats', vm.hatsVisible, vm, vm.testTable),
        buildChartItem('Gloves', vm.glovesVisible, vm, vm.testTable),
        buildChartItem('Belts', vm.beltsVisible, vm, vm.testTable),
        buildChartItem('Rings', vm.ringsVisible, vm, vm.testTable),
        buildChartItem('Eyewear', vm.eyewearVisible, vm, vm.testTable),
      ],
    );
  }

  Widget buildChartItem(String title, bool showChart, ChartVM vm, Widget data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              GestureDetector(
                onTap: () {
                  if (title == 'Clothing') {
                    vm.toggleClothing();
                  } else if (title == 'Jeans') {
                    vm.toggleJeans();
                  } else if (title == 'Shoes') {
                    vm.toggleShoes();
                  } else if (title == 'Hats') {
                    vm.toggleHats();
                  } else if (title == 'Gloves') {
                    vm.toggleGloves();
                  } else if (title == 'Belts') {
                    vm.toggleBelts();
                  } else if (title == 'Rings') {
                    vm.toggleRings();
                  } else {
                    vm.toggleEyewear();
                  }
                },
                child: Image.asset('assets/icons/icons_24/ic_cevron_down.png'),
              ),
            ],
          ),
          showChart == true
              ? Container(
                  child: data,
                )
              : Container(),
        ],
      ),
    );
  }
}
