import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/epandaple_text.dart';
import 'package:fakebook_flutter_app/src/helpers/read_more_text.dart';
import 'package:fakebook_flutter_app/src/helpers/screen.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab_controller.dart';
import 'package:fakebook_flutter_app/src/widgets/comment_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/image_view.dart';
import 'package:fakebook_flutter_app/src/widgets/video_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/models/post1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PostWidget extends StatefulWidget {
  final PostModel post;
  String username;

  PostWidget({this.post, this.username});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  HomeController homeController = HomeController();

  @override
  void initState() {
    homeController.likeBehavior(widget.post.is_liked);
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorWhite,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
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
                        text: TextSpan(children: [
                          TextSpan(
                            text: widget.post.author.username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: kColorBlack),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print(widget.post.author.username);
                              },
                          ),
                          TextSpan(
                            text: widget.post.status != null
                                ? widget.post.status.length == 0
                                    ? ""
                                    : " đang cảm thấy " +
                                        widget.post.status +
                                        "."
                                : "",
                            style: TextStyle(color: kColorBlack),
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
          ),

          //Text(post.content, style: TextStyle(fontSize: 15.0)),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ExpandableText(widget.post.described)),
          ),
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
          GestureDetector(
              onTap: () {
                if (widget.post.video == null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageView(widget.post.image)));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VideoPlayerScreen(widget.post.video)));
                }
              },
              child: assetView()),
          StreamBuilder(
              stream: homeController.isLikedStream,
              builder: (context, snapshot) {
                int other = int.parse(widget.post.like);
                if (!snapshot.hasData) {
                  homeController.likeBehavior(widget.post.is_liked);
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
                    stream: homeController.isLikedStream,
                    builder: (context, snapshot) {
                      return FlatButton(
                        onPressed: () {
                          widget.post.is_liked = !widget.post.is_liked;
                          homeController.likeBehavior(widget.post.is_liked);
                          /* get like ở đây*/
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }

  Widget assetView() {
    if (widget.post.video != null)
      return Padding(
        padding: EdgeInsets.all(ConstScreen.sizeDefault),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(widget.post.video.thumb),
            Icon(
              Icons.play_circle_filled_rounded,
              color: kColorWhite,
              size: 120,
            ),
          ],
        ),
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
            padding: EdgeInsets.all(0),
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
                Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width / 2.15,
                    child: Image.network(
                      widget.post.image[0].url,
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  width: 7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.15,
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
        builder: (context, setState) =>
            CommentWidget(widget.post, widget.username, homeController),
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

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}
