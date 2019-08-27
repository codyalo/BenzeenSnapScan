import 'package:flutter/material.dart';
import 'package:snap_scan/layout_elements.dart';

class HistoryArea extends StatelessWidget {

  final Widget page;

  final List<String> entries = <String>[
    'Able',
    'Baker',
    'Charlie',
    'Dog',
    'Easy',
    'Fox'
  ];
  HistoryArea(this.page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(36.0),
        child: AppBar(
          title: Text("Upload History", style: TextStyle(color: Colors.black)),
          backgroundColor: OrangeColor,
          elevation: 0,  //0 removes drop shadow
        ),
      ),
      resizeToAvoidBottomInset: false,  //don't resize to fit keyboard
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DividerLine(4, GreyColor, 0),
          Expanded( //history takes up entire allowed area
            child: ListView.separated(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container( //list entries are white rectangles
                  height: 56,
                  color: Colors.white,
                  child: ListTile(
                    title: Text('${entries[index]}'),
                    trailing: IconButton( //each entry has an orange arrow to press to view item details
                        icon: Icon(Icons.arrow_forward_ios,
                            size: 48, color: OrangeColor),
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlideLeftRoute(page: page), //navigates to details page passed from main
                          );
                        }),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 4),  //the space between list items
            ),
          ),
          DividerLine(4, GreyColor, 0),
        ],
      ),
    );
  }
}
