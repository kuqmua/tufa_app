import 'package:Tufa/bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tufa/colors.dart';
import 'package:Tufa/login_screen/login_screen.dart';
import 'package:Tufa/feed_page/feed_page.dart';
//import 'package:Tufa/my_list_view/my_list_view_stack.dart';
import 'package:Tufa/full_post/full_post.dart';
//import 'package:Tufa/full_post/full_post_stack.dart';
import 'package:Tufa/search_page/search_page.dart';
//import 'package:Tufa/search_page/chat_window.dart';
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
      title: 'Tufa',
      debugShowCheckedModeBanner: false,
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isListView = true;
  bool isLoading = false;
  bool isFullPost = false;
  bool isSearchPage = false;
  bool isLoginPage = false;

  ScrollController scrollController;
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    isVisible = true;
    scrollController = new ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isVisible = false;
        });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
            bottomNavigationBar:
                isFullPost ? null : BottomBar(isVisible: isVisible),
            body: isListView
                ? FeedPage(
                    isLoading: isLoading, scrollController: scrollController)
                : isFullPost
                    ? FullPost()
                    : isSearchPage
                        ? SearchPage()
                        : isLoginPage
                            ? LoginScreen()
                            : Center(child: Text('NOTHING'))));
  }
}
/*
          drawer: Theme(
            data: Theme.of(context).copyWith(canvasColor: backgroundColor),
            child: Drawer(
              child: ListView(children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: Text('sac'),
                  accountName: Text('name'),
                  currentAccountPicture: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.amber,
                    /*
                      child: Image(
                        image: AssetImage('assets/cat200x200x30.jpg'),
                      )
                      */
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  trailing: Icon(
                    Icons.bluetooth,
                    color: Colors.white,
                  ),
                ),
               
              ]),
            ),
          ),
          */
/*
          body: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text('slivertitle'),
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                )
              ];
            },
            body: isListView
                ? MyListView(
                    isLoading: isLoading, scrollController: scrollController)
                : isFullPost
                    ? FullPost(
                        //scrollController: scrollController
                        )
                    : isSearchPage
                        ? SearchPage(
                            //scrollController: scrollController
                            )
                        : isLoginPage
                            ? LoginScreen()
                            : Center(child: Text('NOTHING')),
                            */

/*
bottomNavigationBar:
                isFullPost ? null : BottomBar(isVisible: isVisible),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                title: Text('Random title'),
              ),
            ),
            body: isListView
                ? FeedPage(
                    isLoading: isLoading, scrollController: scrollController)
                : isFullPost
                    ? FullPost(
                        //scrollController: scrollController
                        )
                    : isSearchPage
                        ? SearchPage(
                            //scrollController: scrollController
                            )
                        : isLoginPage
                            ? LoginScreen()
                            : Center(child: Text('NOTHING'))


*/
