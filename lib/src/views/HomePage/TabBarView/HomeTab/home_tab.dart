import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_controller.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_page.dart';
import 'package:fakebook_flutter_app/src/widgets/write_something_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/separator_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/post_widget.dart';
import 'package:fakebook_flutter_app/src/models/post1.dart';
import 'package:flutter/material.dart';

String data;

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  bool keepAlive = false;

  Map<String, dynamic> postReturn;
  String username;
  String avatar;
  CreatePostController createPostController = new CreatePostController();

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

  @override
  void didUpdateWidget(Widget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //print(oldWidget);
  }

  Future<String> createPost() async {
    await createPostController.onSubmitCreatePost(
        images: postReturn["images"],
        video: postReturn["video"],
        described: postReturn["described"],
        status: postReturn["status"],
        state: postReturn["state"],
        can_edit: postReturn["can_edit"],
        asset_type: postReturn["asset_type"]);
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                            right: MediaQuery.of(context).size.width / 2.5,
                            left: 30),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          'Bạn đang nghĩ gì?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          final a =
                              await Navigator.pushNamed(context, "create_post");
                          if (a != null) postReturn = a;
                        },
                      )
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          if (postReturn != null)
            Column(
              children: [
                SeparatorWidget(),
                FutureBuilder(
                    future: createPost(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0)),
                              //SizedBox(height: 0.0),
                              Expanded(child: SizedBox()),
                              CircularProgressIndicator(),
                            ],
                          ),
                        );
                      } else {
                        if (snapshot.hasError)
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        else {
                          data = snapshot.data;
                          return Center(child: new Text('${data}'));
                        }
                      }
                    }),
              ],
            ),
          SeparatorWidget(),
          StreamBuilder(builder: (context, snapshot) {
            return ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: list_posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostWidget(
                        post: list_posts[index],
                        username: username,
                      ),
                      SeparatorWidget(),
                    ],
                  );
                });
          }),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
