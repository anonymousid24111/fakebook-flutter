import 'package:flutter/material.dart';
// import './models/friends.dart';

class FriendItem extends StatelessWidget {
  var friends;
  FriendItem({this.friends});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // final item = this.friends.avatar;
    return Column(
      children: [
        Container(
          // width: MediaQuery.of(context).size.width * 0.27,
          height: 105.0,
          width: 105.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: friends["avatar"] == null
                      ? AssetImage("assets/avatar.jpg")
                      : NetworkImage(friends["avatar"]))),
          child: FlatButton(
            onPressed: () {
              print(this.friends["username"]);
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: FlatButton(
            onPressed: () {
              print(this.friends["username"]);
            },
            child: Text(this.friends["username"] != null
                ? this.friends["username"]
                : "Người dùng Fakebook"),
          ),
        )
      ],
    );
  }
}
