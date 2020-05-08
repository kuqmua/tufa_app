import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/login_screen/login_screen.dart';
import 'package:Tufa/feed_page/feed_page.dart';
import 'package:Tufa/full_post/full_post.dart';
import 'package:Tufa/search_page/search_page.dart';
import 'package:Tufa/bottom_nav_page_wrapper.dart';
import 'package:flutter/rendering.dart';

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
    //SystemChrome.setEnabledSystemUIOverlays([]);
    /*
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    */

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/bottomNavPageWrapper': (context) => BottomNavPageWrapper(),
        '/feedPage': (context) => FeedPage(),
        '/searchPage': (context) => SearchPage(),
        '/fullPost': (context) => FullPost(),
      },
      title: 'Tufa',
      debugShowCheckedModeBanner: false,
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
          splashColor: Colors.red,
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
