import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tufa/feed.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/login_screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Tufa',
      debugShowCheckedModeBanner: true,
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: backgroundColor,
        accentColor: borderColor,
        scaffoldBackgroundColor: backgroundColor,
        textSelectionColor: blue,
        backgroundColor: backgroundColor,
        //textTheme: ,
        iconTheme: IconThemeData(
          color: grey,
          size: 18.0, //пока что ни на что не влияет
        ),
        fontFamily: 'Lora',

        buttonColor: backgroundColor,
        //buttonTheme , для кнопок с текстом
        //textTheme ,
        //focusColor ,
        //hoverColor ,
        //highlightColor ,
        splashColor: borderColor,
        //unselectedWidgetColor ,
        //disabledColor ,
        //textSelectionColor ,
        //textSelectionHandleColor ,
        //dialogBackgroundColor ,
        //indicatorColor ,
        //hintColor
        //errorColor ,
        //toggleableActiveColor ,
        //primaryTextTheme ,
        //accentTextTheme ,
        //primaryIconTheme ,
        //accentIconTheme ,
        //sliderTheme ,
        //materialTapTargetSize ,
        //pageTransitionsTheme ,
        //colorScheme: ,
        //colorScheme ,
        //dialogTheme: ,
        //typography ,
        //snackBarTheme: ,
        //bottomSheetTheme ,
        //popupMenuTheme: ,
        //floatingActionButtonTheme: ,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool login = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: login ? LoginScreen() : Feed());
  }
}
