import 'package:flutter/material.dart';
import 'package:Tufa/autor_name.dart';
import 'package:Tufa/publication_date.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Tufa/colors.dart';

class TopPostPart extends StatefulWidget {
  TopPostPart({Key key}) : super(key: key);

  @override
  _TopPostPartState createState() => _TopPostPartState();
}

class _TopPostPartState extends State<TopPostPart> {
  List<IconData> list = [
    Entypo.vk,
    AntDesign.youtube,
    MaterialCommunityIcons.hackernews,
    AntDesign.github,
    FontAwesome.twitch,
    MaterialCommunityIcons.alpha_h_circle,
    Feather.book,
    Entypo.medium,
    MaterialCommunityIcons.artstation,
    EvilIcons.sc_telegram,
    FontAwesome.reddit_square,
    FontAwesome.twitter_square,
    MaterialCommunityIcons.alpha_n_box
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Icon(
                FontAwesome.twitch,
                size: 17,
              ),
            ),
            AutorName(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text(
                'r/pytorch ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: grey,
                  fontSize: 16,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            PublicationDate(),
          ],
        ),

        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 60,
                  height: 14,
                  decoration: BoxDecoration(
                    //color: border,
                    border: Border.all(
                      color: blue,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  /*
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blue,
                      fontSize: 16,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  */
                ),
              )
            ],
          ),
        ),
        //HorizontalLine(),
      ],
    );
  }
}
/*
 Icon(
              Icons.hearing,
              size: 18,
              color: blue,
            ),


Container(
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: border,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Text(
                '#hashtag',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blue,
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w300,
                ),
              ),
            )



Text(
              '#open',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: blue,
                fontSize: 18,
                fontFamily: 'Lora',
                fontWeight: FontWeight.w300,
              ),
            ),
            
*/
