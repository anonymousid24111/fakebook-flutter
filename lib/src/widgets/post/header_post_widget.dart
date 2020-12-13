import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/Profile/friend_profile_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HeaderPost extends StatefulWidget {
  PostModel post;
  String username;

  HeaderPost(this.post, this.username);

  @override
  _HeaderPostState createState() => _HeaderPostState();
}

class _HeaderPostState extends State<HeaderPost> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: kColorGrey,
            radius: 20.0,
            backgroundImage: widget.post.author.avatar == null
                ? AssetImage('assets/avatar.jpg')
                : NetworkImage(widget.post.author.avatar),
          ),
          SizedBox(width: 7.0),
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  maxLines: 2,
                  text: TextSpan(
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color),
                      children: [
                        TextSpan(
                          text: widget.post.author.username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            //color: kColorBlack
                          ),
                          recognizer: TapGestureRecognizer(debugOwner: true)
                            ..onTap = () {
                              print(widget.post.author.username);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FriendProfile(
                                          friendId: widget.post.author.id)));
                            },
                        ),
                        TextSpan(
                          text: widget.post.status != null
                              ? widget.post.status.length == 0
                                  ? ""
                                  : " " + widget.post.status + "."
                              : "",
                        ),
                      ]),
                ),
                //SizedBox(height: 0.0),
                Text(widget.post.created)
              ],
            ),
          ),
          IconButton(
            constraints: BoxConstraints(maxHeight: 25, minHeight: 5),
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              widget.username != widget.post.author.username
                  ? showMoreOthers(context)
                  : showMoreYourself(context);
            },
            alignment: Alignment.topCenter,
          )
        ],
      ),
    );
  }

  showMoreYourself(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: 300,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.notifications_none),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Tắt thông báo về bài viết này"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.bookmark_outline),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Lưu bài viết"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.restore_from_trash_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Xóa"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Chỉnh sửa bài viết"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.animation,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sao chép liên kết",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  showMoreOthers(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: 240,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.ac_unit_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Lưu bài viết"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.restore_from_trash_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Tìm hỗ trợ hoặc báo cáo bài viết"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.ac_unit_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Bật thông báo về bài viết"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.ac_unit_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Sao chép liên kết"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
