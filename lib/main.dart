import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:Tufa/wrapper.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/login_screen/login_screen.dart';
import 'package:Tufa/my_list_view/my_list_view.dart';
import 'package:Tufa/full_post/full_post.dart';
import 'package:Tufa/search_page/search_page.dart';

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
        iconTheme: IconThemeData(
          color: grey,
          size: 20.0, //пока что ни на что не влияет
        ),
        fontFamily: 'Lora',
        buttonColor: backgroundColor,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
          minWidth: 80.0,
          height: 40.0,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
          focusColor: blue,
          hoverColor: Colors.yellow,
          highlightColor: Colors.red,
          splashColor: grey,
          colorScheme: ColorScheme(
              primary: Colors.red,
              primaryVariant: Colors.red[400],
              secondary: Colors.green,
              secondaryVariant: Colors.green[400],
              surface: Colors.blue,
              background: Colors.black,
              error: Colors.pink,
              onPrimary: Colors.redAccent,
              onSecondary: Colors.orange,
              onSurface: Colors.orangeAccent,
              onBackground: Colors.blueAccent,
              onError: Colors.blueGrey,
              brightness: Brightness.light),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        textTheme: TextTheme(
          headline1: loginPasswordTextStyle,
          headline2: signUpButtonTextStyle,
          headline3: signInButtonTextStyle,
          headline5: postProviderNameTextStyle,
          headline4: postPublicationDateTextStyle,
          bodyText1: postAutorTextStyle,
          bodyText2: postTextStyle,
        ),
        splashColor: grey,
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
  bool loginPage = false;
  bool isLoading = false;
  bool isFullPost = false;
  bool searchPage = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: loginPage
            ? LoginScreen()
            : isFullPost
                ? FullPost()
                : searchPage ? SearchPage() : MyListView(isLoading: false));
  }
}
