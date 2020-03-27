import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class PostText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextOverflow textOverflow;

  const PostText({
    Key key,
    @required this.text,
    this.maxLines,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: Text(
          text,
          softWrap: true,
          maxLines: maxLines ?? null,
          overflow: textOverflow ?? TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "Lora",
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: softerwhite,
          ),
        ));
  }
}
