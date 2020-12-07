import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/epandaple_text.dart';

import 'package:fakebook_flutter_app/src/helpers/screen.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageView extends StatefulWidget {
  PostModel post;
  String username;

  ImageView(this.post, this.username);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
 
  HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.likeBehavior(widget.post.is_liked);
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: kColorGrey,
                  radius: 20.0,
                  backgroundImage: widget.post.author.avatar == null
                      ? AssetImage('assets/avatar.jpg')
                      : NetworkImage(widget.post.author.avatar),
                ),
                SizedBox(width: 7.0),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          height: 28,
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            height: 3,
                            minWidth: 3,
                            onPressed: () {},
                            child: Text(widget.post.author.username,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17.0)),
                          ),
                        ),
                        Text(
                          widget.post.status != null
                              ? widget.post.status.length == 0
                              ? ""
                              : "đang cảm thấy " + widget.post.status + "."
                              : "",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    //SizedBox(height: 0.0),
                    Text(widget.post.created)
                  ],
                ),
                Expanded(child: SizedBox()),
                IconButton(
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

            SizedBox(height: 10.0),

            //Text(post.content, style: TextStyle(fontSize: 15.0)),

            Align(
                alignment: Alignment.centerLeft,
                child: ExpandableText(widget.post.described)),
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
            GestureDetector(onTap: () {
              if(widget.post.video == null){
                //Navigator.pushNamed(context, routeName)
              }
            }, child: assetView()),
            StreamBuilder(
                stream: homeController.isLikedStream,
                builder: (context, snapshot) {
                  return FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.thumbsUp,
                                size: 15.0, color: Colors.blue),
                            Text(
                                "${int.parse(widget.post.like) + (widget.post.is_liked ? 1 : 0)}"),
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
                      stream: homeController.isLikedStream,
                      builder: (context, snapshot) {
                        return FlatButton(
                          onPressed: () {
                            widget.post.is_liked = !widget.post.is_liked;
                            homeController.likeBehavior(widget.post.is_liked);
                            /* get like ở đây*/
                          },
                          child: Row(
                            children: <Widget>[
                              snapshot.hasData
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
        ),
      ),
    );
  }

  Widget assetView() {
    if (widget.post.video != null)
      return Padding(
        padding: EdgeInsets.all(ConstScreen.sizeDefault),
        child: Image.network(widget.post.video.thumb),
      );
    if (widget.post.image.length != 0) {
      switch (widget.post.image.length) {
        case 1:
          return Padding(
            padding: EdgeInsets.all(0),
            child: Image.network(
              widget.post.image[0].url,
              fit: BoxFit.contain,
            ),
          );
        case 2:
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: List.generate(widget.post.image.length, (index) {
              String asset = widget.post.image[index].url;
              return Padding(
                  padding: EdgeInsets.all(0), child: Image.network(asset));
            }),
          );
        case 3:
          return Container(
            padding: EdgeInsets.all(ConstScreen.sizeDefault),
            child: Row(
              children: [
                Expanded(
                  child: Image.network(widget.post.image[0].url),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(widget.post.image[1].url),
                      Image.network(widget.post.image[2].url),
                    ],
                  ),
                )
              ],
            ),
          );
        case 4:
          return GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(0),
            children: List.generate(widget.post.image.length, (index) {
              String asset = widget.post.image[index].url;
              return Image.network(asset);
            }),
          );
      }
    }
    if (widget.post.image.length == 0 && widget.post.video == null)
      return SizedBox.shrink();
  }

  Widget bottomSheetHeader() {
    return StreamBuilder(
        stream: homeController.isLikedStream,
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
                      homeController.likeBehavior(widget.post.is_liked);
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
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10,
          right: 10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 0.5)),
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

  showComment(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      //enableDrag: true,
      //isDismissible: true,
      //useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => StatefulBuilder(
        //stream: homeController.isLikedStream,
        builder: (context, setState) => SizedBox(
          height: MediaQuery.of(context).size.height / 1.033,
          child: widget.post.like == "00" && widget.post.comment == "0"
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
        ),
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
                          Icon(Icons.ac_unit_sharp),
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
                          Icon(Icons.restore_from_trash_sharp),
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
                          Icon(Icons.ac_unit_sharp),
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
                          Icon(Icons.ac_unit_sharp),
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
                            Icons.done,
                            color: kColorBlue,
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
