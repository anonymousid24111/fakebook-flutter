import 'package:fakebook_flutter_app/src/helpers/epandaple_text.dart';
import 'package:fakebook_flutter_app/src/helpers/read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/models/post1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostWidget extends StatelessWidget {

  final Post post;

  PostWidget({
    this.post
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(post.profileImageUrl),
                radius: 20.0,
              ),
              SizedBox(width: 7.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                  SizedBox(height: 5.0),
                  Text(post.time)
                ],
              ),
            ],
          ),

          SizedBox(height: 20.0),

          //Text(post.content, style: TextStyle(fontSize: 15.0)),

          ExpandableText(post.content),
/*
          ReadMoreText(
            post.content,
            trimLines: 2,
            colorClickableText: Colors.grey,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...xem thêm',
            trimExpandedText: ' show less',
          ),
*/
          SizedBox(height: 10.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.thumbsUp, size: 15.0, color: Colors.blue),
                  Text(' ${post.likes}'),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('${post.comments} bình luận  •  '),
                  Text('${post.shares} chia sẻ'),
                ],
              ),
            ],
          ),

          Divider(height: 30.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.thumbsUp, size: 20.0),
                  SizedBox(width: 5.0),
                  Text('Thích', style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.commentAlt, size: 20.0),
                  SizedBox(width: 5.0),
                  Text('Bình luận', style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.share, size: 20.0),
                  SizedBox(width: 5.0),
                  Text('Chia sẻ', style: TextStyle(fontSize: 14.0)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}