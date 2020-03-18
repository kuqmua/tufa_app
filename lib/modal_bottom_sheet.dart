import 'package:Tufa/colors.dart';
import 'package:flutter/material.dart';
import 'package:Tufa/modal_bottom_sheet_choice.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/my_divider.dart';

class ModalBottomSheet extends StatefulWidget {
  ModalBottomSheet({Key key}) : super(key: key);

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  List<IconData> list = [
    MaterialIcons.expand_more,
    Feather.share_2,
    AntDesign.staro,
    MaterialCommunityIcons.comment_outline
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 1.5,
                margin: EdgeInsets.fromLTRB(24, 30, 25, 0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment
                        .bottomCenter, // 10% of the width, so there are ten blinds.
                    colors: [
                      background,
                      border,
                    ], // whitish to gray
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 5,
                      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      decoration: BoxDecoration(
                        color: border,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ModalBottomSheetChoice(
                                icon: Feather.share_2, text: 'Share post'),
                            MyDivider(),
                            ModalBottomSheetChoice(
                                icon: AntDesign.staro,
                                text: 'Add in bookmarks'),
                            MyDivider(),
                            ModalBottomSheetChoice(
                                icon: MaterialCommunityIcons.comment_outline,
                                text: 'Open Comments'),
                            MyDivider(),
                            ModalBottomSheetChoice(
                                icon: SimpleLineIcons.user_unfollow,
                                text: 'Unfollow user'),
                            MyDivider(),
                            ModalBottomSheetChoice(
                                icon: Entypo.block,
                                text: 'Block content provider'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.5,
                margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      background,
                      border,
                    ],
                    tileMode: TileMode.repeated,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}