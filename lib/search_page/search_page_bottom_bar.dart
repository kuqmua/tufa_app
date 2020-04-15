import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/search_page/search_mbsh.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchPageBottomBar extends StatefulWidget {
  SearchPageBottomBar({Key key}) : super(key: key);

  @override
  _SearchPageBottomBarState createState() => _SearchPageBottomBarState();
}

class _SearchPageBottomBarState extends State<SearchPageBottomBar> {
  void modalBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return SearchMbsh();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border(
            top: BorderSide(
              //                    <--- top side
              color: softerwhite,
              width: 0.2,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              //height: 20,
              child: IconButton(
                  icon: new Icon(
                    AntDesign.arrowleft,
                    color: grey,
                  ),
                  onPressed: () {}),
            ),
            Expanded(
              child: Container(
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
            ),
            Container(
              //height: 20,
              child: IconButton(
                  icon: new Icon(
                    Entypo.menu,
                    color: grey,
                  ),
                  onPressed: modalBottomSheet),
            ),
          ],
        ));
  }
}
