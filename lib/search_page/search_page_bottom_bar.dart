import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
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
          return Container(
              height: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 5,
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            decoration: BoxDecoration(
                              color: borderColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  DropdownButton<String>(
                                    hint: Text('Search where?'),
                                    items: <String>['A', 'B', 'C', 'D']
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                  DropdownButton<String>(
                                    hint: Text('Categories'),
                                    items: <String>['A', 'B', 'C', 'D']
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                  DropdownButton<String>(
                                    hint: Text('with image'),
                                    items: <String>['A', 'B', 'C', 'D']
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                  DropdownButton<String>(
                                    hint: Text('time'),
                                    items: <String>['A', 'B', 'C', 'D']
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      borderSide: BorderSide(color: grey, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: softerwhite, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: "search feed for last hour",
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
