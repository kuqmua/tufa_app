import 'package:Tufa/colors.dart';
import 'package:flutter/material.dart';
import 'package:Tufa/modal_bottom_sheet/mbsh_choice.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/my_divider.dart';
import 'package:Tufa/modal_bottom_sheet/mbsh_line_gradient.dart';

class Mbsh extends StatefulWidget {
  Mbsh({Key key}) : super(key: key);

  @override
  _MbshState createState() => _MbshState();
}

class _MbshState extends State<Mbsh> {
  List<IconData> list = [
    MaterialIcons.expand_more,
    Feather.share_2,
    AntDesign.staro,
    MaterialCommunityIcons.comment_outline
  ];
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
              MbshLineGradient(),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MbshChoice(
                                icon: Feather.share_2, text: 'Share post'),
                            MyDivider(),
                            MbshChoice(
                                icon: AntDesign.staro,
                                text: 'Add in bookmarks'),
                            MyDivider(),
                            MbshChoice(
                                icon: MaterialCommunityIcons.comment_outline,
                                text: 'Open Comments'),
                            MyDivider(),
                            MbshChoice(
                                icon: SimpleLineIcons.user_follow,
                                text: 'Follow user'),
                            MyDivider(),
                            MbshChoice(
                                icon: Entypo.block,
                                text: 'Block content provider'),
                            MyDivider(),
                            MbshChoice(icon: AntDesign.filter, text: 'Filter'),
                            MyDivider(),
                            MbshChoice(
                                icon: AntDesign.link, text: 'Show post links'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MbshLineGradient(),
            ],
          ),
        ));
  }
}
