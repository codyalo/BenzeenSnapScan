import 'package:flutter/material.dart';
import 'package:snap_scan/layout_elements.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';

class ImagesArea extends StatelessWidget {

  final Widget page;

  ImagesArea(this.page);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DividerLine(4, GreyColor, 0),
        Expanded( //images take up the entire allowed area
          child: Images(), //call images to build image grid and buttons
        ),
        DividerLine(4, GreyColor, 0),
        Container( //bottom button to save and return to main page
          height: 60,
          child: RaisedButton(
              color: OrangeColor,
              child: Text('Done'),
              onPressed: () {
                Navigator.push(
                  context,
                  SlideRightRoute(page: page), //navigates to main page passed from main
                );
              }),
        ),
      ],
    );
  }
}


class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  List<Asset> images = List<Asset>();
  String _error;

    @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 256,
        enableCamera: true,
      );
    } on Exception catch (e) {
     // error = e.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: GreyColor,
        body: Column(
          children: <Widget>[
         //   Center(child: Text('Error: $_error')),
            Expanded(
              child: Container (
             //   padding: EdgeInsets.only(left: 12, right:12),
                child: buildGridView(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: loadAssets,
        tooltip: 'Add New Image',
        child: Icon(Icons.add_a_photo),
        backgroundColor: Color(0xFF14B46E),
      ),
      ),
    );
  }
}