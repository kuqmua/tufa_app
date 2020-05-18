import 'package:flutter/material.dart';
import 'package:Tufa/feed_page/feed_page.dart';
import 'package:Tufa/test_widget_pages/reddit_wrapper.dart';
import 'package:Tufa/test_widget_pages/hackernews_wrapper.dart';
import 'package:Tufa/search_page/search_page.dart';
import 'package:Tufa/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomNavPageWrapper extends StatefulWidget {
  BottomNavPageWrapper({Key key}) : super(key: key);

  @override
  _BottomNavPageWrapperState createState() => _BottomNavPageWrapperState();
}

class _BottomNavPageWrapperState extends State<BottomNavPageWrapper> {
  int _index = 0;

  Widget callPage(int _index) {
    switch (_index) {
      case 0:
        return FeedPage();

      case 1:
        return SearchPage();
      case 2:
        return RedditWrapper(title: 'wow'); //TODO: remove it
      case 3:
        return HackerNewsWrapper();
        break;
      default:
        return FeedPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          backgroundColor: backgroundColor,
          onTap: (newIndex) => setState(() => _index = newIndex),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: grey),
                title: Container(
                    height: 0.0,
                    child: Text("",
                        style: TextStyle(color: grey, fontSize: 0.0)))),
            BottomNavigationBarItem(
                icon: Icon(AntDesign.search1, color: grey),
                title: Container(
                    height: 0.0,
                    child: Text("",
                        style: TextStyle(color: grey, fontSize: 0.0)))),
            BottomNavigationBarItem(
                icon: Icon(AntDesign.filter, color: grey),
                title: Container(
                    height: 0.0,
                    child: Text("",
                        style: TextStyle(color: grey, fontSize: 0.0)))),
            BottomNavigationBarItem(
                icon: Icon(Feather.bookmark, color: grey),
                title: Container(
                    height: 0.0,
                    child: Text("",
                        style: TextStyle(color: grey, fontSize: 0.0)))),
            BottomNavigationBarItem(
                icon: Icon(Entypo.menu, color: grey),
                title: Container(
                    height: 0.0,
                    child: Text("",
                        style: TextStyle(color: grey, fontSize: 0.0)))),
          ],
        ),
        body: callPage(_index),
      ),
    );
  }
}
