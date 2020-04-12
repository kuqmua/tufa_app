import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class PostText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextOverflow textOverflow;
  final double fontSize;

  const PostText({
    Key key,
    @required this.text,
    this.maxLines,
    this.textOverflow,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      maxLines: maxLines ?? null,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: "Lora",
        fontWeight: FontWeight.w300,
        fontSize: fontSize ?? 18,
        color: softerwhite,
      ),
    );
  }
}
