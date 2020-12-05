import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/epandaple_text.dart';
import 'package:fakebook_flutter_app/src/helpers/read_more_text.dart';
import 'package:fakebook_flutter_app/src/helpers/screen.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/models/post1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostWidget extends StatefulWidget {
  final PostModel post;
  String username;
  PostWidget({this.post, this.username});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  showComment(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context) => new SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Column(
                children: [
                  Text('Bạn có muốn hoàn thành bài viết của mình sau?'),
                  Text(
                      "Lưu làm bản nháp hoặc bạn có thể tiếp tục chỉnh sửa"),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
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
                      Text("Lưu làm bản nháp"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(Icons.restore_from_trash_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Bỏ bài viết"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
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
                        "Tiếp tục chỉnh sửa",
                        style: TextStyle(color: kColorBlue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
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
                        widget.post.status.isEmpty
                            ? ""
                            : "đang cảm thấy " + widget.post.status + ".",
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
                onPressed: () {},
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
          assetView(),
          FlatButton(
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
          ),

          Divider(
            height: 5.0,
            thickness: 1,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      widget.post.is_liked = !widget.post.is_liked;
                      /* get like ở đây*/
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      widget.post.is_liked
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
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {showComment(context);},
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
                    onPressed: () {},
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
}
