import 'package:flutter/material.dart';
import 'package:Tufa/feed_page/feed_page.dart';
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
          currentIndex: _index,
          backgroundColor: backgroundColor,
          onTap: (newIndex) => setState(() => _index = newIndex),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: grey),
                title: Text("Home", style: TextStyle(color: grey))),
            BottomNavigationBarItem(
                icon: Icon(AntDesign.search1, color: grey),
                title: Text("Search", style: TextStyle(color: grey))),
            BottomNavigationBarItem(
                icon: Icon(AntDesign.filter, color: grey),
                title: Text("Filter", style: TextStyle(color: grey))),
          ],
        ),
        body: callPage(_index),
      ),
    );
  }
}
