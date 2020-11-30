import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/views/CreatePost/create_post_page.dart';
import 'package:fakebook_flutter_app/src/widgets/write_something_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/separator_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/post_widget.dart';
import 'package:fakebook_flutter_app/src/models/post1.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
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
                          radius: 28.0,
                          backgroundImage: AssetImage('assets/avatar.jpg'),
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
                          //print(await StorageUtil.getUid()+"alo");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePostPage()),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          SeparatorWidget(),
          StreamBuilder(
              builder: (context, snapshot) {
            return ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PostWidget(
                        post: posts[index],
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
}
