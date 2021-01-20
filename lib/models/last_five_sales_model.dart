import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class LastFiveSalesModel {
  final String sale;
  final double taka;
  final charts.Color barColor;

  LastFiveSalesModel({@required this.sale, @required this.taka, @required this.barColor});
}
