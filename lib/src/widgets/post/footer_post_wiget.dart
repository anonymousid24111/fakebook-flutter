import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab_controller.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/post_widget_controller.dart';
import 'package:fakebook_flutter_app/src/widgets/post/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterPost extends StatefulWidget {
  PostModel post;
  PostController controller;
  String username;

  FooterPost(this.post, this.controller, this.username);

  @override
  _FooterPostState createState() => _FooterPostState();
}

class _FooterPostState extends State<FooterPost> {
  @override
  void initState() {
    //widget.homeController.likeBehavior(widget.post.is_liked);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: widget.controller.isLikedStream,
            builder: (context, snapshot) {
              int other = int.parse(widget.post.like);
              if (!snapshot.hasData) {
                widget.controller..likeBehavior(widget.post.is_liked);
                return SizedBox.shrink();
              } else {
                widget.post.is_liked
                    ? other = int.parse(widget.post.like)
                    : other = int.parse(widget.post.like) - 1;
                return FlatButton(
                  //padding: EdgeInsets.symmetric(vertical: 0),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.thumbsUp,
                              size: 15.0, color: Colors.blue),
                          if (snapshot.data && other == 0)
                            Text(widget.username ?? "null")
                          else if (snapshot.data && other != 0)
                            Text("Bạn và ${other} người khác")
                          else
                            Text("${int.parse(widget.post.like)}"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('${widget.post.comment} bình luận  •  '),
                          Text('0 chia sẻ'),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }),
        Divider(
          height: 5.0,
          thickness: 1,
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                  initialData:
                      widget.controller.likeBehavior(widget.post.is_liked),
                  stream: widget.controller.isLikedStream,
                  builder: (context, snapshot) {
                    return FlatButton(
                      onPressed: () {
                        widget.post.is_liked = !widget.post.is_liked;
                        widget.controller.likeBehavior(widget.post.is_liked);
                        /* get like ở đây*/
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          snapshot.data
                              ? Icon(
                                  FontAwesomeIcons.solidThumbsUp,
                                  size: 20.0,
                                  color: kColorBlue,
                                )
                              : Icon(
                                  FontAwesomeIcons.thumbsUp,
                                  size: 20.0,
                                ),
                          SizedBox(width: 5.0),
                          Text('Thích', style: TextStyle(fontSize: 14.0)),
                        ],
                      ),
                    );
                  }),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  showComment(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.commentAlt, size: 20.0),
                    SizedBox(width: 5.0),
                    Text('Bình luận', style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              ),
            ),
            if (widget.username != widget.post.author.username)
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    print(widget.post.toJson());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.share, size: 20.0),
                      SizedBox(width: 5.0),
                      Text('Chia sẻ', style: TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ),
              )
          ],
        )
      ],
    );
  }

  showComment(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      enableDrag: true,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.964,
          child:
              CommentWidget(widget.post, widget.controller, widget.username)),
    );
  }
}
