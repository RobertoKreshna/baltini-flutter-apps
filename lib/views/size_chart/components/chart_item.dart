import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/size_chart/vm/size_chart_vm.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  String title;
  ChartVM vm;
  Widget data;

  ChartItem(this.title, this.vm, this.data);

  @override
  Widget build(BuildContext context) {
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
                  vm.toggleCondition(title);
                },
                child: Image.asset(arrowdown),
              ),
            ],
          ),
          vm.condition[title] == true
              ? Container(
                  child: data,
                )
              : Container(),
        ],
      ),
    );
  }
}
