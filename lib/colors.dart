import 'package:flutter/material.dart';

const backgroundColor = const Color.fromRGBO(22, 32, 42, 1.0);
const darkBackgroundColor = const Color.fromRGBO(16, 23, 31, 1.0);
const borderColor = const Color.fromRGBO(32, 48, 62, 1.0);
const white = const Color.fromRGBO(255, 255, 255, 1.0);
const softerwhite = const Color.fromRGBO(225, 225, 225, 1.0);
const grey = const Color.fromRGBO(155, 175, 186, 1.0);
const blue = const Color.fromRGBO(32, 137, 199, 1.0);

const String defaultFontName = 'Lora';
const double postTextFontSize = 16;
const double topPostPartTextFontSize = 17;
const double signInTextFontSize = 16;
const double signUpTextFontSize = 16;
const double loginPasswordTextFontSize = 18;

const postTextStyle = TextStyle(
  fontFamily: defaultFontName,
  fontWeight: FontWeight.w300,
  fontSize: postTextFontSize,
  color: softerwhite,
);

const postAutorTextStyle = TextStyle(
  fontFamily: defaultFontName,
  fontWeight: FontWeight.w300,
  fontSize: topPostPartTextFontSize,
  color: white,
);

const postProviderNameTextStyle = TextStyle(
  fontFamily: defaultFontName,
  fontWeight: FontWeight.w300,
  fontSize: topPostPartTextFontSize,
  color: grey,
);

const postPublicationDateTextStyle = TextStyle(
  fontFamily: defaultFontName,
  fontWeight: FontWeight.w300,
  fontSize: topPostPartTextFontSize,
  color: grey,
);

const signInButtonTextStyle = TextStyle(
  fontFamily: defaultFontName,
  fontWeight: FontWeight.w300,
  fontSize: signInTextFontSize,
  color: borderColor,
);

const signUpButtonTextStyle = TextStyle(
  fontFamily: defaultFontName,
  fontWeight: FontWeight.w300,
  fontSize: signUpTextFontSize,
  color: white,
);

const loginPasswordTextStyle = TextStyle(
  fontFamily: defaultFontName,
  fontWeight: FontWeight.w300,
  fontSize: loginPasswordTextFontSize,
  color: white,
);
