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
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        //scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        maxLengthEnforced: true,
        //maxLength: 30,
        style: TextStyle(
          color: white,
          fontSize: 18,
          fontFamily: 'Lora',
          fontWeight: FontWeight.w300,
        ),
        enableSuggestions: true,
        enableInteractiveSelection: true,
        cursorColor: blue,
        autocorrect: false,
        autofocus: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: softerwhite),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: softerwhite),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintText: "Password",
          hintStyle: TextStyle(
            color: white,
            //fontSize: 16,
            fontFamily: 'Lora',
            fontWeight: FontWeight.w300,
          ),
          filled: true,
        ),
        obscureText: true,
      ),
    );
  }
}
