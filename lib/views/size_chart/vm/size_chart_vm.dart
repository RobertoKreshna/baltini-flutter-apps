import 'package:flutter/material.dart';

class ChartVM extends ChangeNotifier {
  Map<String, bool> condition = {
    'Clothing': false,
    'Jeans': false,
    'Shoes': false,
    'Hats': false,
    'Gloves': false,
    'Belts': false,
    'Rings': false,
    'Eyewear': false,
  };

  Widget clothingChart = Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
        4: FlexColumnWidth(1),
        5: FlexColumnWidth(1),
      },
      border: TableBorder.all(color: Color.fromRGBO(232, 236, 238, 1.0)),
      children: [
        makeTableRow('Standard', 'IT', 'FR', 'US', 'UK', 'JP'),
        makeTableRow('XXXS', '36', '32', '0', '4', '3'),
        makeTableRow('XXS', '38', '34', '2', '6', '5'),
        makeTableRow('XS', '40', '36', '4', '8', '7'),
        makeTableRow('S', '42', '38', '6', '10', '9'),
        makeTableRow('M', '44', '40', '8', '12', '11'),
        makeTableRow('L', '46', '42', '10', '14', '13'),
        makeTableRow('XL', '48', '44', '12', '16', '15'),
        makeTableRow('XXL', '50', '46', '14', '18', '17'),
        makeTableRow('XXXL', '52', '48', '16', '20', '19'),
      ]);

  Widget testTable = Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
        4: FlexColumnWidth(1),
        5: FlexColumnWidth(1),
      },
      border: TableBorder.all(color: Color.fromRGBO(232, 236, 238, 1.0)),
      children: [
        makeTableRow('Standard', 'IT', 'FR', 'US', 'UK', 'JP'),
      ]);

  toggleCondition(String key) {
    condition[key] = !condition[key]!;
    notifyListeners();
  }

  static makeTableRow(String text1, String text2, String text3, String text4,
      String text5, String text6) {
    return TableRow(children: [
      Container(
          decoration: BoxDecoration(color: Color.fromRGBO(232, 236, 238, 1.0)),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              text1,
              style: TextStyle(fontSize: 14),
            ),
          ))),
      Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text2,
          style: TextStyle(fontSize: 14),
        ),
      )),
      Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text3,
          style: TextStyle(fontSize: 14),
        ),
      )),
      Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text4,
          style: TextStyle(fontSize: 14),
        ),
      )),
      Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text5,
          style: TextStyle(fontSize: 14),
        ),
      )),
      Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text6,
          style: TextStyle(fontSize: 14),
        ),
      )),
    ]);
  }
}
