import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_back_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_search_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_filter_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_bookmark_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_share_button.dart';
import 'package:Tufa/full_post/full_post_bottom_bar/fpbb_menu_button.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FullPostBottomBar extends StatefulWidget {
  FullPostBottomBar({Key key}) : super(key: key);

  @override
  _FullPostBottomBarState createState() => _FullPostBottomBarState();
}

class _FullPostBottomBarState extends State<FullPostBottomBar> {
  Widget showFindBottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.13,
          child: IconButton(
              icon: new Icon(
                AntDesign.arrowleft,
                color: grey,
              ),
              onPressed: () {}),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.74,
          height: 40,
          child: TextField(
            style: TextStyle(color: grey, fontSize: 18),
            maxLengthEnforced: true,
            enableSuggestions: true,
            enableInteractiveSelection: true,
            cursorColor: blue,
            autocorrect: false,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: darkBackgroundColor,
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),

              prefixIcon: Icon(
                AntDesign.search1,
                color: grey,
                size: 14,
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: softerwhite, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: softerwhite, width: 0.1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),

              hintText: "search ", //feed for last hour
              hintStyle: TextStyle(color: grey, fontSize: 18),
              filled: true,
            ),
            obscureText: false,
            onSubmitted: (String value) async {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks!'),
                    content: Text('You typed "$value".'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.13,
          child: IconButton(
              icon: new Icon(
                Entypo.menu,
                color: grey,
              ),
              onPressed: () {}),
        ),
      ],
    );
  }

  bool shownFind = false;

  void searchPress() {
    shownFind = !shownFind;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).primaryColor,
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  //                    <--- top side
                  color: softerwhite,
                  width: 0.2,
                ),
              ),
            ),
            child: shownFind == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FpbbBackButton(),
                      IconButton(
                          icon: new Icon(
                            AntDesign.search1,
                            color: grey,
                          ),
                          disabledColor: Colors.green,
                          onPressed: searchPress),
                      FpbbFilterButton(),
                      FpbbBookmarkButton(),
                      FpbbShareButton(),
                      FpbbMenuButton(),
                    ],
                  )
                : showFindBottomBar()));
  }
}
