import 'package:flutter/material.dart';
import 'package:Tufa/colors.dart';

class TextForm extends StatefulWidget {
  TextForm({Key key}) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      //scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      onSubmitted: (String value) async {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thanks!'),
              content: Text('You typed "$value".'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },

      maxLengthEnforced: true,
      //maxLength: 30,
      style: Theme.of(context).textTheme.headline1,
      enableSuggestions: true,
      enableInteractiveSelection: true,
      cursorColor: blue,
      autocorrect: false,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 3, 15, 3),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: softerwhite),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: softerwhite),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        hintText: "Password",
        hintStyle: Theme.of(context).textTheme.headline1,
        filled: true,
      ),
      obscureText: true,
    );
  }
}
