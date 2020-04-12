import 'package:Tufa/colors.dart';
import 'package:flutter/material.dart';
import 'package:Tufa/post/action_button_mbsh/action_button_mbsh_choice.dart';
import 'package:Tufa/post/action_button_mbsh/action_button_mbsh_line_gradient.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/my_divider.dart';

class ActionButtonMbsh extends StatefulWidget {
  ActionButtonMbsh({Key key}) : super(key: key);

  @override
  _ActionButtonMbshState createState() => _ActionButtonMbshState();
}

class _ActionButtonMbshState extends State<ActionButtonMbsh> {
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
              ActionButtonMbshLineGradient(),
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
                            ActionButtonMbshChoice(
                                icon: Feather.share_2, text: 'Share post'),
                            MyDivider(),
                            ActionButtonMbshChoice(
                                icon: AntDesign.staro,
                                text: 'Add in bookmarks'),
                            MyDivider(),
                            ActionButtonMbshChoice(
                                icon: MaterialCommunityIcons.comment_outline,
                                text: 'Open Comments'),
                            MyDivider(),
                            ActionButtonMbshChoice(
                                icon: SimpleLineIcons.user_follow,
                                text: 'Follow user'),
                            MyDivider(),
                            ActionButtonMbshChoice(
                                icon: Entypo.block,
                                text: 'Block content provider'),
                            MyDivider(),
                            ActionButtonMbshChoice(
                                icon: AntDesign.filter, text: 'Filter'),
                            MyDivider(),
                            ActionButtonMbshChoice(
                                icon: AntDesign.link, text: 'Show post links'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ActionButtonMbshLineGradient(),
            ],
          ),
        ));
  }
}
