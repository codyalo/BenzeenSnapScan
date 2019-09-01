import 'package:flutter/material.dart';
import 'package:snap_scan/layout_elements.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:snap_scan/perf_chart.dart';

class PerformanceArea extends StatelessWidget {
  
  PerformanceArea();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(36.0),
        child: AppBar(
          title: Text("Daily Processed Parts & Vehicles", style: TextStyle(color: Colors.black)),
          automaticallyImplyLeading: false,
          backgroundColor: OrangeColor,
          elevation: 0,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 12, top: 4, right: 12, bottom: 12),
        child: DailyPerformance(),
      ),
    );
  }
}

class DailyPerformance extends StatefulWidget {
  @override
  _DailyPerformanceState createState() => _DailyPerformanceState();
}

class _DailyPerformanceState extends State<DailyPerformance> {
  List<charts.Series<DailyPerf, String>> mapChartData() {
    final perfData = [
      DailyPerf('Today', 50),
      DailyPerf('Average', 250),
      DailyPerf('Best', 400),
    ];
    final maxData = [
      DailyPerf('Today', 1000 - perfData[0].getCount),
      DailyPerf('Average', 1000 - perfData[1].getCount),
      DailyPerf('Best', 1000 - perfData[2].getCount),
    ];

    /// Create one series with pass in data.
    return [
      charts.Series<DailyPerf, String>(
        id: 'Performance',
        colorFn: (_, __) => charts.Color(r: 240, g: 140, b: 20, a: 254),
        domainFn: (DailyPerf perf, _) => perf.day,
        measureFn: (DailyPerf perf, _) => perf.count,
        data: perfData,
      ),
      charts.Series<DailyPerf, String>(
        id: 'Maximum',
        colorFn: (_, __) => charts.Color(r: 0, g: 0, b: 0, a: 254),
        domainFn: (DailyPerf perf, _) => perf.day,
        measureFn: (DailyPerf perf, _) => perf.count,
        data: maxData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PerfBarChart(mapChartData()),
    );
  }
}
