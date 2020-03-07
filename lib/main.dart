import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tufa/feed.dart';
import 'package:Tufa/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: background,
      systemNavigationBarColor: background,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Tufa',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: background,
        accentColor: border,
        scaffoldBackgroundColor: background,
        textSelectionColor: blue,
        backgroundColor: background,
        //textTheme: ,
        iconTheme: IconThemeData(
          color: grey,
          size: 18.0,
        ),
        fontFamily: 'Lora',

        //buttonColor, для кнопок с текстом
        //buttonTheme , для кнопок с текстом
        //textTheme ,
        //focusColor ,
        //hoverColor ,
        //highlightColor ,
        //splashColor ,
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Feed());
  }
}
