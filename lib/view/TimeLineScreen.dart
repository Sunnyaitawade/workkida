
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workkida/common/widgets/common_divider.dart';
import 'package:workkida/common/widgets/label_icon.dart';
import 'package:workkida/model/constants/UiConstants.dart';
import 'package:workkida/model/core/PostTimeLineModel.dart';
import 'dart:math';

import 'package:workkida/model/services/PostBloc.dart';
class TimeLineScreen extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLineScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: bodySliverList(),
    );
  }
//Following wigdets are used to scrolllist posts
  Widget bodySliverList() {
    PostBloc postBloc = PostBloc();
    return StreamBuilder<List<Post>>(
        stream: postBloc.postItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(

            slivers: <Widget>[
              bodyList(snapshot.data),
            ],
          )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget bodyList(List<Post> posts) => SliverList(

    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: postCard(context, posts[index],index),
      );
    }, childCount: posts.length),
  );
//post cards
  Widget postCard(BuildContext context, Post post,index) {
    return Bubble(
      margin: BubbleEdges.only(top: 10),
      color: checkifSender(index),
      nip: checkifSenderNip(index),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: profileColumn(context, post),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.message,
              style: GoogleFonts.lato(),
//              TextStyle(
//                  fontWeight: FontWeight.normal,
//                  //fontFamily: UIData.ralewayFont
//              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          post.messageImage != null
              ? Image.network(
            post.messageImage,
            fit: BoxFit.cover,
          )
              : Container(),
          post.messageImage != null ? Container() : CommonDivider(),
          actionColumn(post),
        ],
      ),
    );

  }
//  //post cards
//  Widget postCard(BuildContext context, Post post) {
//    return Card(
//      elevation: 2.0,
//      child: Column(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: profileColumn(context, post),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Text(
//              post.message,
//              style: GoogleFonts.lato(),
////              TextStyle(
////                  fontWeight: FontWeight.normal,
////                  //fontFamily: UIData.ralewayFont
////              ),
//            ),
//          ),
//          SizedBox(
//            height: 10.0,
//          ),
//          post.messageImage != null
//              ? Image.network(
//            post.messageImage,
//            fit: BoxFit.cover,
//          )
//              : Container(),
//          post.messageImage != null ? Container() : CommonDivider(),
//          actionColumn(post),
//        ],
//      ),
//    );
//
//  }

  //column1
  Widget profileColumn(BuildContext context, Post post) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(post.personImage),
      ),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.personName,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .apply(fontWeightDelta: 700),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  post.address,
                  style: Theme.of(context).textTheme.caption.apply(
                      fontFamily: UIData.ralewayFont, color: Colors.pink),
                )
              ],
            ),
          ))
    ],
  );

  //column last
  Widget actionColumn(Post post) => FittedBox(
    fit: BoxFit.contain,
    child: ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        LabelIcon(
          label: "${post.likesCount} Likes",
          icon: FontAwesomeIcons.solidThumbsUp,
          iconColor: Colors.green,
        ),
        LabelIcon(
          label: "${post.commentsCount} Comments",
          icon: FontAwesomeIcons.comment,
          iconColor: Colors.blue,
        ),
        Text(
          post.postTime,
          style: GoogleFonts.lato()//TextStyle(fontFamily: UIData.ralewayFont),
        )
      ],
    ),
  );
  Color checkifSender(index){
    return  (index %2 == 0) ? Color.fromRGBO(225, 255, 199, 1.0) : Color.fromRGBO(212, 234, 244, 1.0) ;

  }
    checkifSenderNip(index){
    return  (index %2 == 0) ? BubbleNip.rightTop : BubbleNip.leftTop ;

  }
}