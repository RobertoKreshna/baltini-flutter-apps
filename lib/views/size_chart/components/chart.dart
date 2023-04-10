import 'package:baltini_flutter_apps/views/size_chart/components/chart_item.dart';
import 'package:baltini_flutter_apps/views/size_chart/vm/size_chart_vm.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  ChartVM vm;

  Chart(this.vm);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartItem('Clothing', vm, vm.clothingChart),
        ChartItem('Jeans', vm, vm.testTable),
        ChartItem('Shoes', vm, vm.testTable),
        ChartItem('Hats', vm, vm.testTable),
        ChartItem('Gloves', vm, vm.testTable),
        ChartItem('Belts', vm, vm.testTable),
        ChartItem('Rings', vm, vm.testTable),
        ChartItem('Eyewear', vm, vm.testTable),
      ],
    );
  }
}
