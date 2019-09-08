import 'package:flutter/material.dart';
import 'package:snap_scan/layout_elements.dart';
import 'package:snap_scan/api_services.dart';
import 'package:snap_scan/json_post.dart';
//import 'package:snap_scan/main.dart';

class DetailsArea extends StatelessWidget {
  // DetailsArea();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
        future: getPost(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${snapshot.data.roNum}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold)),
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: OrangeColor,
            ),
            resizeToAvoidBottomInset: false, //don't resize to fit keyboard
            body: Column(
              children: [
                Expanded(
                  //take up the entire allowed area
                  child: Container(
                    //give the entire detail text area a white baground
                    color: Colors.white,
                    padding:
                        EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
                    child: Column(
                      //3 sections; part info, notes, image count
                      children: [
                        Container(
                          //part or vehicle info
                          child: Column(
                              //details page is made up of two rows
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    height: 28,
                                    child: Text(
                                        '${snapshot.data.modelYear} ${snapshot.data.modelName}',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    height: 28,
                                    child: Text('${snapshot.data.partName}',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold))),
                                Row(children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                            height: 26,
                                            child: Text(
                                                'Interchange: ' +
                                                    '${snapshot.data.invNum}',
                                                style:
                                                    TextStyle(fontSize: 16.0))),
                                        Container(
                                            height: 26,
                                            child: Text(
                                                'Stock #: ' +
                                                    '${snapshot.data.stockNum}',
                                                style:
                                                    TextStyle(fontSize: 16.0))),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                            height: 26,
                                            child: Text(
                                                'Grade: ' +
                                                    '${snapshot.data.rating}',
                                                textAlign: TextAlign.right,
                                                style:
                                                    TextStyle(fontSize: 16.0))),
                                        Container(
                                            height: 26,
                                            child: Text(
                                                'Location: ' +
                                                    '${snapshot.data.location}',
                                                textAlign: TextAlign.right,
                                                style:
                                                    TextStyle(fontSize: 16.0))),
                                      ],
                                    ),
                                  ),
                                ]),
                              ]),
                        ),
                        DividerLine(4, OrangeColor, 0),
                        Expanded(
                          //notes will expand to take up more space if necessary
                          child: Container(
                              alignment: Alignment(-1.0, 0),
                              child: Text('Notes: ' + '${snapshot.data.notes}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style:
                                      TextStyle(fontSize: 16.0, height: 1.20))),
                        ),
                        DividerLine(4, OrangeColor, 0),
                        Container(
                          alignment: Alignment(-1.0, 0),
                          child: Text('Images: ' + '${snapshot.data.images}',
                              style: TextStyle(fontSize: 16.0, height: 1.20)),
                          height: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
