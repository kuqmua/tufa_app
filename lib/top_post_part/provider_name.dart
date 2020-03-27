import 'package:flutter/material.dart';

class ProviderName extends StatelessWidget {
  const ProviderName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'r/pytorch',
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
