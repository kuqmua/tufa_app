import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';
//import 'package:flutter_icons/flutter_icons.dart';

class SearchMbsh extends StatefulWidget {
  SearchMbsh({Key key}) : super(key: key);

  @override
  _SearchMbshState createState() => _SearchMbshState();
}

class _SearchMbshState extends State<SearchMbsh> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
  }
}
