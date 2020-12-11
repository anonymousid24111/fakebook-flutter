import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab_controller.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/post_widget_controller.dart';
import 'package:fakebook_flutter_app/src/widgets/post/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        FlatButton(
          //padding: EdgeInsets.symmetric(vertical: 0),
          onPressed: () {
            showComment(context, false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.thumbsUp,
                      size: 15.0, color: Colors.blue),
                  StreamBuilder(
                      initialData: widget.post.is_liked,
                      stream: widget.controller.isLikedStream,
                      builder: (context, snapshot1) {
                        return StreamBuilder(
                            initialData: widget.post.like,
                            stream: widget.controller.likeNumberStream,
                            builder: (context, snapshot2) {
                              if (snapshot1.data == true &&
                                  snapshot2.data == "1")
                                return Text(widget.username);
                              else if (snapshot1.data == true &&
                                  snapshot2.data != "1")
                                return Text("Bạn và " +
                                    "${int.parse(snapshot2.data) - 1}" +
                                    " người khác");
                              else
                                return Text("${int.parse(snapshot2.data)}");
                            });
                      }),
                ],
              ),
              Row(
                children: <Widget>[
                  StreamBuilder(
                      initialData: widget.post.comment,
                      stream: widget.controller.commentNumberStream,
                      builder: (context, snapshot) {
                        return Text('${snapshot.data} bình luận  •  ');
                      }),
                  Text('0 chia sẻ'),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 5.0,
          thickness: 1,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                  initialData: widget.post.is_liked,
                  stream: widget.controller.isLikedStream,
                  builder: (context, snapshot1) {
                    return StreamBuilder(
                        initialData: widget.post.like,
                        stream: widget.controller.likeNumberStream,
                        builder: (context, snapshot2) {
                          return FlatButton(
                            onPressed: () {
                              widget.controller.likeBehavior(
                                  !snapshot1.data, snapshot2.data);
                              /* get like ở đây*/
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                snapshot1.data
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
                        });
                  }),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  showComment(context, true);
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
                    print(widget.post.id);
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

  showComment(BuildContext context, bool autoFocus) {
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
          child: CommentWidget(
              widget.post, widget.controller, widget.username, autoFocus)),
    );
  }
}
