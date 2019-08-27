import 'package:flutter/material.dart';
import 'package:snap_scan/layout_elements.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class ScannerArea extends StatefulWidget {
  @override
  _ScannerAreaState createState() => new _ScannerAreaState();
}

class _ScannerAreaState extends State<ScannerArea> {

  String id;
  bool camState = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(36.0),
      child: AppBar(
        title:
            Text("Scan Part or Vehicle", style: TextStyle(color: Colors.black)),
        backgroundColor: OrangeColor,
        elevation: 0,
      ),
    ),
    resizeToAvoidBottomInset: false,  //don't resize to fit keyboard
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      DividerLine(4, GreyColor, 0),
        TextField(  //text input for looking up part or vehicle number
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: 'Enter R# or VIN# or Stock#'),
        ),
        DividerLine(4, GreyColor, 0),
        Expanded(  //area for viewfinder/scanner
          child: Container(
              child: camState  //built in from qr plugin
                    ? new Center(
                        child: new SizedBox(  //QrCamera has to be inside either a box or container
                          child: new QrCamera(
                            onError: (context, error) => Text(
                                  error.toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                            qrCodeCallback: (code) {  //scanning barcodes returns a code
                              setState(() {
                                id = code;  //pass the retrieved code to id string
                              });
                            },
                          ),
                        ),
                      )
                    : new Center(child: new Text("View Finder Off", style: TextStyle(fontSize: 18, color: Colors.white)))
              ),
        ),
        DividerLine(4, GreyColor, 0),
      ],
    ),
          floatingActionButton: new FloatingActionButton(
          tooltip: 'Toggle View Finder',
          child: Icon(Icons.wb_iridescent, size: 32),
          backgroundColor: camState? Color(0xFFB4146E): Color(0xFF14B46E),
          onPressed: () {
            setState(() {
              camState = !camState;
            });
          }),
    );
  }
}

