import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class ProviderName extends StatelessWidget {
  const ProviderName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'r/pytorch',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: grey,
        fontSize: 16,
        fontFamily: 'Lora',
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
