import 'package:flutter/material.dart';

class ProviderName extends StatefulWidget {
  final Color textColor;
  final double fontSize;
  final String providerText;
  ProviderName(
      {Key key, this.textColor, this.fontSize, @required this.providerText})
      : super(key: key);

  @override
  _ProviderNameState createState() => _ProviderNameState();
}

class _ProviderNameState extends State<ProviderName> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.providerText,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w300,
        fontSize: widget.fontSize,
        color: widget.textColor,
      ),
    );
  }
}
