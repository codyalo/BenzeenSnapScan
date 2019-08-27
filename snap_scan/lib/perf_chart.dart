import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PerfBarChart extends StatelessWidget {

  final List<charts.Series> seriesList;
  final bool animate;

  PerfBarChart(this.seriesList, {this.animate = true});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,

      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(

              //tick and Label styling
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 16,
                  color: charts.MaterialPalette.white),

              //line colors to match text color
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),

      //style for the measure axis
      primaryMeasureAxis: new charts.NumericAxisSpec(
        //  tickProviderSpec:
        //      new charts.BasicNumericTickProviderSpec(desiredTickCount: 5), //number of axis ticks
        
          renderSpec: new charts.GridlineRendererSpec(

              //tick and Label styling
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 16,
                  color: charts.MaterialPalette.white),

              //line colors to match text color
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
    );
  }
}

//daily performance data type.
class DailyPerf {
  final String day;
  final int count;

  DailyPerf(this.day, this.count);

  int get getCount { //allow us to get count to calculate bar fills
    return count;
  }
}
