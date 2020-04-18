import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TufaSvg extends StatelessWidget {
  const TufaSvg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/svg/tufacut.svg',
        //height: 90,
        color: Colors.white,
        semanticsLabel: 'Acme Logo');
  }
}
