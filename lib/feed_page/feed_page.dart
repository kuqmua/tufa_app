import 'package:Tufa/feed_page/bottom_bar/bottom_bar.dart';
import 'package:Tufa/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text('Random title'),
          ),
        ),
        body: widget.isLoading
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
                child: ListView.builder(
                  controller: widget.scrollController,
                  itemCount: 5,
                  itemBuilder: (ctx, i) => Post(),
                )));
  }
}
/*
Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: Text('Random title'),
          ),
        ),
        body: widget.isLoading
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
                child: ListView.builder(
                  controller: widget.scrollController,
                  itemCount: 5,
                  itemBuilder: (ctx, i) => Post(),
                )));
*/
/*
CustomScrollView(
        controller: widget.scrollController,
        slivers: <Widget>[
          PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: SliverAppBar(
              title: Text("мб уберу эту панельку"),
              leading: Icon(Icons.menu),
              backgroundColor: backgroundColor,
              elevation: 10,
              floating: true,
              snap: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            widget.isLoading
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
                    child: Post(),
                  )
          ])),
          SliverList(
              delegate: SliverChildListDelegate([
            widget.isLoading
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
                    child: Post(),
                  )
          ])),
          SliverList(
              delegate: SliverChildListDelegate([
            widget.isLoading
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
                    child: Post(),
                  )
          ])),
          SliverList(
              delegate: SliverChildListDelegate([
            widget.isLoading
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
                    child: Post(),
                  )
          ])),
          SliverList(
              delegate: SliverChildListDelegate([
            widget.isLoading
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
                    child: Post(),
                  )
          ]))
        ]);
  
*/
