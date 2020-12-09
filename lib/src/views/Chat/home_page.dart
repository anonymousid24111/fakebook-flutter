import 'dart:convert';

// import 'package:fakebook_flutter_app/src/constant/data.dart';
import 'package:fakebook_flutter_app/src/constant/data.dart';
import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/internet_connection.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/views/Chat/chat_detail_page.dart';
import 'package:fakebook_flutter_app/src/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  var conversations = [];
  var myId;
  var myUsername;
  var myAvatar;
  @override
  void initState() {
    super.initState();
    var ff = () async {
      String token = await StorageUtil.getToken();
      String id = await StorageUtil.getUid();
      String username = await StorageUtil.getUsername();
      String avatar = await StorageUtil.getAvatar();

      if (await InternetConnection.isConnect()) {
        var res = await FetchData.getListConversation(token, "0", "20");
        var data = await jsonDecode(res.body);
        print(data);
        if (res.statusCode == 200) {
          setState(() {
            // friends = data["data"]["friends"];
            conversations = data["data"];
            myId = id;
            myUsername = username;
            myAvatar = avatar;

            // print(conversations);
            // print(data["data"]["friends"]);
          });
        } else {
          print("Lỗi server");
        }
      }
    };
    ff();
  }

  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://scontent.fhan2-4.fna.fbcdn.net/v/t1.0-9/83505313_716313622106910_7025259730981355520_o.jpg?_nc_cat=110&ccb=2&_nc_sid=09cbfe&_nc_ohc=BOeI3maznqoAX-eD-eC&_nc_ht=scontent.fhan2-4.fna&oh=ef79f02f4dc8a3441b5a82ccd506e33d&oe=5FE7565B"),
                      fit: BoxFit.cover)),
            ),
            Text(
              "Chats",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.edit)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: grey, borderRadius: BorderRadius.circular(15)),
          child: TextField(
            cursorColor: black,
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  LineIcons.search,
                  color: black.withOpacity(0.5),
                ),
                hintText: " Tìm kiếm ",
                border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: grey),
                      child: Center(
                        child: Icon(
                          LineIcons.plus,
                          size: 36,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 75,
                      child: Align(
                          child: Text(
                        'Your Story',
                        overflow: TextOverflow.ellipsis,
                      )),
                    )
                  ],
                ),
              ),
              // Row(
              //       children: List.generate(userStories.length, (index) {
              //     return Padding(
              //       padding: const EdgeInsets.only(right: 5),
              //       child: Column(
              //         children: <Widget>[
              //           InkWell(
              //             onTap: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                           ChatDetailPage()));
              //             },
              //             child: Container(
              //               width: 75,
              //               height: 70,
              //               child: Stack(
              //                 children: <Widget>[
              //                   true
              //                       ? Container(
              //                           decoration: BoxDecoration(
              //                               shape: BoxShape.circle,
              //                               border: Border.all(
              //                                   color: blue_story, width: 3)),
              //                           child: Padding(
              //                             padding: const EdgeInsets.all(3.0),
              //                             child: Container(
              //                               width: 50,
              //                               height: 50,
              //                               decoration: BoxDecoration(
              //                                   shape: BoxShape.circle,
              //                                   image: DecorationImage(
              //                                       image: NetworkImage(
              //                                           userStories[index]
              //                                               ["avatar"]),
              //                                       fit: BoxFit.cover)),
              //                             ),
              //                           ),
              //                         )
              //                       : Container(
              //                           width: 60,
              //                           height: 60,
              //                           decoration: BoxDecoration(
              //                               shape: BoxShape.circle,
              //                               image: DecorationImage(
              //                                   image: NetworkImage(
              //                                       userStories[index]["avatar"]),
              //                                   fit: BoxFit.cover)),
              //                         ),
              //                   true
              //                       ? Positioned(
              //                           top: 43,
              //                           left: 41,
              //                           child: Container(
              //                             width: 20,
              //                             height: 20,
              //                             decoration: BoxDecoration(
              //                                 color: online,
              //                                 shape: BoxShape.circle,
              //                                 border: Border.all(
              //                                     color: white, width: 3)),
              //                           ),
              //                         )
              //                       : Container()
              //                 ],
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           SizedBox(
              //             width: 75,
              //             child: Text(
              //               userStories[index]["username"],
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           )
              //         ],
              //       ),
              //     );
              //   }))
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: List.generate(conversations.length, (index) {
            String avatar = conversations[index]["partner_id"][0]["_id"] != myId
                ? conversations[index]["partner_id"][0]["avatar"]
                : conversations[index]["partner_id"][1]["avatar"];
            String username =
                conversations[index]["partner_id"][0]["_id"] != myId
                    ? conversations[index]["partner_id"][0]["username"]
                    : conversations[index]["partner_id"][1]["username"];
            String Uid = conversations[index]["partner_id"][0]["_id"] != myId
                ? conversations[index]["partner_id"][0]["_id"]
                : conversations[index]["partner_id"][1]["_id"];
            String conversationId = conversations[index]["_id"];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                              avatar: avatar,
                              username: username,
                              id: Uid,
                              conversationId: conversationId,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: Stack(
                        children: <Widget>[
                          true //check story
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: blue_story, width: 3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  conversations[index]
                                                                  ["partner_id"]
                                                              [0]["_id"] ==
                                                          StorageUtil.getUid()
                                                      ? conversations[index]
                                                              ["partner_id"][1]
                                                          ["avatar"]
                                                      : conversations[index]
                                                              ["partner_id"][0]
                                                          ["avatar"]),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              conversations[index]["partner_id"]
                                                          [0]["_id"] ==
                                                      StorageUtil.getUid()
                                                  ? conversations[index]
                                                          ["partner_id"][1]
                                                      ["avatar"]
                                                  : conversations[index]
                                                          ["partner_id"][0]
                                                      ["avatar"]),
                                          fit: BoxFit.cover)),
                                ),
                          true //checkonline
                              ? Positioned(
                                  top: 43,
                                  left: 41,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: online,
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: white, width: 3)),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          conversations[index]["partner_id"][0]["_id"] ==
                                  StorageUtil.getUid()
                              ? conversations[index]["partner_id"][1]
                                  ["username"]
                              : conversations[index]["partner_id"][0]
                                  ["username"],
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 135,
                          child: Text(
                            conversations[index]["conversation"][0]["_id"] ==
                                    StorageUtil.getUid()
                                ? conversations[index]["conversation"][0]
                                        ["message"] +
                                    conversations[index]["conversation"][0]
                                        ["created"]
                                : "Bạn: " +
                                    conversations[index]["conversation"][0]
                                        ["message"] +
                                    conversations[index]["conversation"][0]
                                        ["created"],
                            style: TextStyle(
                                fontSize: 15, color: black.withOpacity(0.8)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
