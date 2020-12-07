import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_controller.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_page.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab_controller.dart';
import 'package:fakebook_flutter_app/src/widgets/write_something_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/separator_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/post_widget.dart';
import 'package:fakebook_flutter_app/src/models/post1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  String username;
  String avatar;

  CreatePostController createPostController = new CreatePostController();
  HomeController homeController = new HomeController();

  PostModel postSuccess;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StorageUtil.getUsername().then((value) => setState(() {
          username = value;
        }));
    StorageUtil.getAvatar().then((value) => setState(() {
          avatar = value;
        }));
  }

  Future<void> _refresh() async {
    refreshKey.currentState?.show(atTop: false);
    // Clear hết data cũ đi
    await homeController.fetchListPost();
  }

  Widget buildCreatePost() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: CircleAvatar(
              backgroundColor: kColorGrey,
              radius: 28.0,
              backgroundImage: avatar == null
                  ? AssetImage('assets/avatar.jpg')
                  : NetworkImage(avatar),
            ),
          ),
          SizedBox(width: 15.0),
          FlatButton(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 2.5, left: 30),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'Bạn đang nghĩ gì?',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () async {
              await Navigator.pushNamed(context, "create_post")
                  .then((value) async {
                if (value != null) {
                  Map<String, dynamic> postReturn = value;
                  await createPostController.onSubmitCreatePost(
                      images: postReturn["images"],
                      video: postReturn["video"],
                      described: postReturn["described"],
                      status: postReturn["status"],
                      state: postReturn["state"],
                      can_edit: postReturn["can_edit"],
                      asset_type: postReturn["asset_type"]);
                }
              });
            },
          )
        ],
      ),
    );
  }

  Widget buildPostReturn() {
    return Column(
      children: [
        StreamBuilder(
            stream: createPostController.addPostStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return SizedBox.shrink();
              else if (snapshot.data == '') {
                return Column(
                  children: [
                    SeparatorWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: kColorGrey,
                            radius: 20.0,
                            backgroundImage: avatar == null
                                ? AssetImage('assets/avatar.jpg')
                                : NetworkImage(avatar),
                          ),
                          SizedBox(width: 7.0),
                          Text(username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0)),
                          //SizedBox(height: 0.0),
                          Expanded(child: SizedBox()),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.data != '') {
                return Column(
                  children: [
                    SeparatorWidget(),
                    PostWidget(
                      post: snapshot.data,
                      username: username,
                    ),
                  ],
                );
              } else {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
            }),
        SeparatorWidget(),
      ],
    );
  }

  Widget buildBody() {
    return StreamBuilder(
      stream: homeController.loadPostStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData && !snapshot.hasError) {
          homeController.fetchListPost();
          return SizedBox.shrink();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error),
          );
        } else if (snapshot.data == "") {
          return Container(
              width: 30, height: 30, child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    PostWidget(
                      post: snapshot.data[index],
                      username: username,
                    ),
                    SeparatorWidget(),
                  ],
                );
              });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: refreshKey,
        onRefresh: _refresh,
        child: ListView(
          children: [
            buildCreatePost(),
            buildPostReturn(),
            buildBody(),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    createPostController.dispose();
    homeController.dispose();
  }
}
