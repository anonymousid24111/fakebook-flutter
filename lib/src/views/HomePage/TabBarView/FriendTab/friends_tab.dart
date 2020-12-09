import 'dart:convert';

import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/internet_connection.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:flutter/material.dart';

// class FriendsTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FriendsTab();
//   }
// }

class FriendsTab extends StatefulWidget {
  _FriendsTabState createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab>
    with AutomaticKeepAliveClientMixin {
  // var requestedFriends=[];
  var requestedFriends = [];
  var suggestFriends = [];
  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    var ff = () async {
      String token = await StorageUtil.getToken();
      if (await InternetConnection.isConnect()) {
        var res = await FetchData.getRequestedFriends(token, "0", "20");
        var resSuggested =
            await FetchData.getListSuggestedFriends(token, "0", "20");
        var data = await jsonDecode(res.body);
        var dataSuggested = await jsonDecode(resSuggested.body);
        print(data);
        if (res.statusCode == 200 && resSuggested.statusCode == 200) {
          setState(() {
            // friends = data["data"]["friends"];
            requestedFriends = data["data"]["request"];
            suggestFriends = dataSuggested["data"]["list_users"];
            // print(data["data"]["friends"]);
          });
        } else {
          print("Lỗi server");
        }
      }
    };
    ff();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Bạn bè',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 15.0),
              Row(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text('Gợi ý',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text('Tất cả bạn bè',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold)),
                  )
                ],
              ),

              Divider(height: 30.0),

              Row(
                children: <Widget>[
                  Text('Lời mời kết bạn',
                      style: TextStyle(
                          fontSize: 21.0, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10.0),
                  Text(
                      requestedFriends != null
                          ? requestedFriends.length.toString()
                          : "0",
                      style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                ],
              ),

              SizedBox(height: 20.0),
              // Expanded(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: requestedFriends
                    .map((eachFriend) =>
                        RequestedFriendItem(requestedFriendItem: eachFriend))
                    .toList(),
              ),
              // ),

              Divider(height: 30.0),

              Text('Những người bạn có thể biết',
                  style:
                      TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),

              SizedBox(height: 20.0),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: suggestFriends
                    .map((eachFriend) =>
                        SuggestedFriendItem(suggestedFriendItem: eachFriend))
                    .toList(),
              ),

              SizedBox(height: 20.0),
            ],
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class RequestedFriendItem extends StatelessWidget {
  var requestedFriendItem;

  RequestedFriendItem({this.requestedFriendItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: requestedFriendItem["avatar"] != null
                  ? NetworkImage(requestedFriendItem["avatar"])
                  : AssetImage('assets/avatar.jpg'),
              radius: 40.0,
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    requestedFriendItem["username"] != null
                        ? requestedFriendItem["username"]
                        : "Người dùng Fakebook",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text(
                    requestedFriendItem["same_friend"] != null
                        ? '${requestedFriendItem["same_friend"]["same_friends"]} bạn chung'
                        : "0 bạn chung",
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal)),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        if (await InternetConnection.isConnect()) {
                          String token = await StorageUtil.getToken();
                          var res = await FetchData.setAcceptFriend(
                              token, requestedFriendItem["_id"], "1");
                          // var data = await jsonDecode(res.body);
                          if (res.statusCode == 200) {
                            print("chấp nhận thành công");
                          } else {
                            print("lỗi server");
                          }
                        } else {
                          print("lỗi internet");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text('Chấp nhận',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                        onTap: () async {
                          if (await InternetConnection.isConnect()) {
                            String token = await StorageUtil.getToken();
                            var res = await FetchData.setAcceptFriend(
                                token, requestedFriendItem["_id"], "0");
                            // var data = await jsonDecode(res.body);
                            if (res.statusCode == 200) {
                              print("xoá thành công");
                            } else {
                              print("lỗi server");
                            }
                          } else {
                            print("lỗi internet");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text('Xóa ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
                        )),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}

class SuggestedFriendItem extends StatelessWidget {
  var suggestedFriendItem;

  SuggestedFriendItem({this.suggestedFriendItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: suggestedFriendItem["avatar"] != null
                  ? NetworkImage(suggestedFriendItem["avatar"])
                  : AssetImage('assets/avatar.jpg'),
              radius: 40.0,
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    suggestedFriendItem["username"] != null
                        ? suggestedFriendItem["username"]
                        : "Người dùng Fakebook",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text(
                    suggestedFriendItem["same_friends"] != null
                        ? '${suggestedFriendItem["same_friends"]} bạn chung'
                        : "0 bạn chung",
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal)),
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () async {
                          if (await InternetConnection.isConnect()) {
                            String token = await StorageUtil.getToken();
                            var res = await FetchData.setRequestFriend(
                                token, suggestedFriendItem["_id"]);
                            // var data =await jsonDecode(res.body);
                            if (res.statusCode == 200) {
                              print("gửi kết bạn thành công");
                            } else {
                              print("lỗi server");
                            }
                          } else {
                            print("lỗi internet");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text('Thêm bạn bè',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0)),
                        )),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () async {
                        if (await InternetConnection.isConnect()) {
                          String token = await StorageUtil.getToken();
                          var res = await FetchData.notSuggest(
                              token, suggestedFriendItem["_id"]);
                          // var data =await jsonDecode(res.body);
                          if (res.statusCode == 200) {
                            print("thêm vào danh sách không gợi ý");
                          } else {
                            print("lỗi server");
                          }
                        } else {
                          print("lỗi internet");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text('Xóa ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
