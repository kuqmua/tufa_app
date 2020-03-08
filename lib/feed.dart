import 'package:flutter/material.dart';
import 'package:Tufa/my_list_view.dart';
import 'package:Tufa/pseudo_floating_action_button.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:Tufa/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          // both default to 16
          marginRight: 330,
          marginBottom: 10,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          //visible: _dialVisible,
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          //overlayColor: Colors.black,
          overlayOpacity: 0,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: blue,
          foregroundColor: white,
          elevation: 0.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(
                  AntDesign.setting,
                  size: 20,
                ),
                backgroundColor: blue,
                //label: 'First',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => print('FIRST CHILD')),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: blue,
              //label: 'Second',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: Icon(AntDesign.search1),
              backgroundColor: blue,
              //label: 'Third',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('THIRD CHILD'),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 13, 0),
          child: Stack(
            children: <Widget>[
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : MyListView(),
              PseudoFloatingActionButton()
            ],
          ),
        ));
  }
}
