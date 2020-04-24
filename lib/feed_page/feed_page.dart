import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:Tufa/post/post.dart';

class FeedPage extends StatefulWidget {
  final bool isLoading;
  final ScrollController scrollController;
  FeedPage({Key key, @required this.isLoading, @required this.scrollController})
      : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  Widget buildBody() {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: 5,
      itemBuilder: (ctx, i) => Post(),
    );
    /*

    CustomScrollView(slivers: <Widget>[
      
      SliverAppBar(
        title: Text("Sample Slivers"),
        leading: Icon(Icons.menu),
        backgroundColor: backgroundColor,
        floating: true,
        snap: true,
      ),
      
      SliverList(
        delegate: SliverChildListDelegate([
          
        ]),
      )
      */
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.015,
              0,
              MediaQuery.of(context).size.width * 0.015,
              0,
            ),
            child: buildBody(),
          );
  }
}
