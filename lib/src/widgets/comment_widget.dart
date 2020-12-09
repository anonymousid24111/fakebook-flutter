import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentWidget extends StatefulWidget {
  PostModel post;
  String username;
  HomeController homeController;

  CommentWidget(this.post, this.username, this.homeController);
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        //appBar: AppBar(leading: bottomSheetHeader(),),
        body: widget.post.like == "00" && widget.post.comment == "0"
            ? Center(
                child: Text(
                    "Chưa có bình luận nào, hãy là người đầu tiên bình luận"),
              )
            : Column(
                children: [
                  bottomSheetHeader(),
                  Expanded(child: bottomSheetComment()),
                ],
              ),
        bottomSheet: bottomSheetFooter(),
      ),
    );
  }

  Widget bottomSheetHeader() {
    return StreamBuilder(
        stream: widget.homeController.isLikedStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        size: 14,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      widget.post.is_liked
                          ? Text(
                              "Bạn và " + widget.post.like + " người khác",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            )
                          : Text(widget.post.like,
                              style: TextStyle(fontWeight: FontWeight.w800)),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      widget.post.is_liked = !widget.post.is_liked;
                      widget.homeController.likeBehavior(widget.post.is_liked);
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
                              ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget bottomSheetFooter() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          //bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 0.8, color: kColorGrey)),
      ),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          fillColor: kColorGrey,
          border: InputBorder.none,
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
