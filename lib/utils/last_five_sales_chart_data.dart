import 'package:autism_project_demo_2/models/last_five_sales_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

final List<LastFiveSalesModel> lastFiveSalesData = [
  LastFiveSalesModel(
    sale: "1st",
    taka: 10000,
    barColor: charts.ColorUtil.fromDartColor(Colors.blue)
  ),
  LastFiveSalesModel(
      sale: "2nd",
      taka: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue[400])
  ),
  LastFiveSalesModel(
      sale: "3rd",
      taka: 3060,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue[300])
  ),
  LastFiveSalesModel(
      sale: "4th",
      taka: 7400,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue[200])
  ),
  LastFiveSalesModel(
      sale: "5th",
      taka: 1009,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue[100])
  ),
];