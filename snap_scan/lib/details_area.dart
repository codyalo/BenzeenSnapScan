import 'package:flutter/material.dart';
import 'package:snap_scan/layout_elements.dart';

class DetailsArea extends StatelessWidget {

  DetailsArea();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  //don't resize to fit keyboard
      body: Column(
        children: [
      Expanded( //take up the entire allowed area
        child: Container( //give the entire detail text area a white baground
          color: Colors.white,
          child: Column( //3 sections; part info, notes, image count
            children: [
              Container( //part or vehicle info
                height: 160,
              ),
              DividerLine(4, OrangeColor, 24),
              Expanded( //notes will expand to take up more space if necessary
                child: Container(),
              ),
              DividerLine(4, OrangeColor, 24),
              Container( //image count
                height: 36,
              ),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}
