import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab_controller.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/post_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

HomeController homeController = new HomeController();

class CommentWidget extends StatefulWidget {
  PostModel post;
  PostController controller;
  String username;

  CommentWidget(this.post, this.controller, this.username);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  TextEditingController _textEditingController = new TextEditingController();
  var numLines = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 10),
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        /*
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: kColorWhite,
          title: bottomSheetHeader(),
        ),

         */

        body: widget.post.like == "00" && widget.post.comment == "0"
            ? Center(
                child: Text(
                    "Chưa có bình luận nào, hãy là người đầu tiên bình luận"),
              )
            : Column(
                children: [
                  bottomSheetHeader(),
                  Expanded(child: bottomSheetComment()),
                  bottomSheetFooter(),
                ],
              ),
        //bottomSheet: bottomSheetFooter(),
      ),
    );
  }

  Widget bottomSheetHeader() {
    return StreamBuilder(
        stream: widget.controller.isLikedStream,
        builder: (context, snapshot) {
          return Container(
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            height: 50,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: kColorGrey, width: 0.4)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined,
                          size: 14, color: kColorBlack),
                      SizedBox(
                        width: 2,
                      ),
                      widget.post.is_liked
                          ? widget.post.like == "0"
                              ? Text(
                                  widget.username,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: kColorBlack),
                                )
                              : Text(
                                  "Bạn và " + widget.post.like + " người khác",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: kColorBlack),
                                )
                          : Text(widget.post.like,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: kColorBlack)),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: kColorBlack,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      widget.post.is_liked = !widget.post.is_liked;
                      widget.controller.likeBehavior(widget.post.is_liked);
                      print(widget.post.comment_list.length);
                      print(widget.post);
                    },
                    icon: snapshot.hasData
                        ? snapshot.data
                            ? Icon(
                                FontAwesomeIcons.solidThumbsUp,
                                size: 20.0,
                                color: kColorBlue,
                              )
                            : Icon(
                                FontAwesomeIcons.thumbsUp,
                                size: 20.0,
                                color: kColorBlack,
                              )
                        : widget.post.is_liked
                            ? Icon(
                                FontAwesomeIcons.solidThumbsUp,
                                size: 20.0,
                                color: kColorBlue,
                              )
                            : Icon(
                                FontAwesomeIcons.thumbsUp,
                                size: 20.0,
                                color: kColorBlack,
                              ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget bottomSheetFooter() {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 8,
        maxHeight: 106,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 0.6, color: kColorGrey)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 32,
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(numLines == 1 ? 45 : 20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Viết bình luận...",
                        border: InputBorder.none,
                      ),
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {
                          numLines = '\n'.allMatches(value).length + 1;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.emoji_emotions_outlined),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                            onTap: () {
                              print(_textEditingController.text);
                            },
                            child: Icon(
                              Icons.send,
                              color: kColorBlue,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheetComment() {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.post.comment_list.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          leading: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: kColorGrey,
              radius: 25.0,
              backgroundImage: widget.post.comment_list[index].poster.avatar ==
                      null
                  ? AssetImage('assets/avatar.jpg')
                  : NetworkImage(widget.post.comment_list[index].poster.avatar),
            ),
          ),
          title: new Container(
            //alignment: Alignment.centerLeft,
            //margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.grey[300],
            ),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.post.comment_list[index].poster.username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.post.comment_list[index].comment,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
