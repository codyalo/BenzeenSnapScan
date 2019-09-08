import 'package:flutter/material.dart';
import 'package:snap_scan/layout_elements.dart';
import 'package:snap_scan/history_area.dart';
import 'package:snap_scan/scanner_area.dart';
import 'package:snap_scan/performance_area.dart';
import 'package:snap_scan/details_area.dart';
import 'package:snap_scan/images_area.dart';

// entry point for the app,
// the => operator is shorthand for {} when there is only one line of code
void main() => runApp(SnapScan());

// the root widget of our application
class SnapScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: GreyColor),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnapScan"),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      resizeToAvoidBottomInset: false,  //don't resize to fit keyboard

      body: Column(  //main page is made up of three rows
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded( //upload history list
            flex: 3, //30% screen space
            child: HistoryArea(DetailsPage()),
          ),
          Expanded( //text field and view finder
            flex: 3,  //30% screen space
            child: ScannerArea(),
          ),
          Expanded( //user performance graph
            flex: 3,  //30% screen space
            child: PerformanceArea(),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Part/Vehicle #"),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: OrangeColor,
      ),
      resizeToAvoidBottomInset: false,  //don't resize to fit keyboard

      body: Column(  //details page is made up of two rows
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,  //40% screen space
            child: DetailsArea(),  //text details for item
          ),
          Expanded(
            flex: 6,  //60% screen space
            child: ImagesArea(MainPage()),  // images for item
          ),
        ],
      ),
    );
  }
}
