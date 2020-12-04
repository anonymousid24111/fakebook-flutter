import 'dart:ui';

import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/views/Profile/friends_request_item.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/views/Profile/fake_data.dart';
import 'package:fakebook_flutter_app/src/views/Profile/friend_item.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:fakebook_flutter_app/src/views/Profile/friend_item_ViewAll.dart';

class FakeAppProfileStateless extends StatelessWidget {
  Widget build(BuildContext cx) {
    return FakeAppProfileStateful();
  }
}

class FakeAppProfileStateful extends StatefulWidget {
  _FakeAppProfileState createState() => _FakeAppProfileState();
}

class _FakeAppProfileState extends State<FakeAppProfileStateful> {
  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StorageUtil.getUsername().then((value) => setState(() {
          username = value;
        }));
  }
  @override
  Widget build(BuildContext cx) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData(color: kColorBlack),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: kColorBlack,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          FlatButton(
            onPressed: () {},

            //padding: EdgeInsets.symmetric(horizontal: 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                Text('Tìm kiếm trong bài viết, ảnh v...'),
              ],
            ),
          ),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 200.0,
                        margin: EdgeInsets.only(bottom: 100.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg'))),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Positioned(
                              bottom: 2.0,
                              right: -15.0,
                              child: MaterialButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 170.0,
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: FlatButton(
                                                      height: 60.0,
                                                      child: Row(
                                                        children: <Widget>[
                                                          MaterialButton(
                                                            onPressed: () {},
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    224,
                                                                    228,
                                                                    228),
                                                            textColor:
                                                                Colors.white,
                                                            child: Icon(
                                                              Icons
                                                                  .image_rounded,
                                                              size: 18,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            // padding: EdgeInsets.all(10.0),
                                                            shape:
                                                                CircleBorder(),
                                                          ),
                                                          Text('Xem ảnh bìa',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: FlatButton(
                                                      height: 60.0,
                                                      child: Row(
                                                        children: <Widget>[
                                                          MaterialButton(
                                                            onPressed: () {},
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    224,
                                                                    228,
                                                                    228),
                                                            textColor:
                                                                Colors.white,
                                                            child: Icon(
                                                              Icons
                                                                  .upload_rounded,
                                                              size: 28,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            // padding: EdgeInsets.all(0.0),
                                                            shape:
                                                                CircleBorder(),
                                                          ),
                                                          Text('Tải ảnh lên',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                color: Color.fromARGB(255, 224, 228, 228),
                                textColor: Colors.white,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                padding: EdgeInsets.all(0.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 100.0,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Container(
                        height: 190.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg')),
                            border:
                                Border.all(color: Colors.white, width: 6.0)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 224, 228, 228),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_rounded),
                          iconSize: 18,
                          color: Colors.black,
                          onPressed: () {
                            showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 170.0,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: FlatButton(
                                                height: 60.0,
                                                child: Row(
                                                  children: <Widget>[
                                                    MaterialButton(
                                                      onPressed: () {},
                                                      color: Color.fromARGB(
                                                          255, 224, 228, 228),
                                                      textColor: Colors.white,
                                                      child: Icon(
                                                        Icons.image_rounded,
                                                        size: 18,
                                                        color: Colors.black,
                                                      ),
                                                      // padding: EdgeInsets.all(10.0),
                                                      shape: CircleBorder(),
                                                    ),
                                                    Text('Xem ảnh đại diện',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                onPressed: () {},
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: FlatButton(
                                                height: 60.0,
                                                child: Row(
                                                  children: <Widget>[
                                                    MaterialButton(
                                                      onPressed: () {},
                                                      color: Color.fromARGB(
                                                          255, 224, 228, 228),
                                                      textColor: Colors.white,
                                                      child: Icon(
                                                        Icons.upload_rounded,
                                                        size: 28,
                                                        color: Colors.black,
                                                      ),
                                                      // padding: EdgeInsets.all(0.0),
                                                      shape: CircleBorder(),
                                                    ),
                                                    Text('Chọn ảnh đại diện',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                onPressed: () {},
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                        // padding: EdgeInsets.all(0.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 100.0),
            //alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.73,
                      height: 39.0,
                      child: RaisedButton.icon(
                        onPressed: () {
                          print('Click Thêm vào tin');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        label: Text(
                          'Thêm vào tin',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: FlatButton(
                        height: 39.0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        onPressed: () => {_personalPageSetting()},
                        color: Colors.black12,
                        child: Column(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(17.0, 0, 17.0, 0),
            child: const Divider(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 12.0),
                    Text(
                      'Publisher tại ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Google',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.house),
                    SizedBox(width: 12.0),
                    Text(
                      'Sống tại ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'New York, Florida',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.school),
                    SizedBox(width: 12.0),
                    Text(
                      'Học Quản trị kinh doanh tại ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Harvard University',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on),
                    SizedBox(width: 12.0),
                    Text(
                      'Đến từ ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Hà Nội, Hà Nội, Việt Nam',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.more_horiz),
                    SizedBox(width: 12.0),
                    Text(
                      'Xem thông tin giới thiệu của bạn ',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        height: 37.0,
                        child: Text(
                          'Chỉnh sửa chi tiết công khai',
                          style: TextStyle(color: Colors.blue),
                        ),
                        color: Color.fromARGB(205, 200, 223, 247),
                        onPressed: () {
                          _EditProfile();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            child: const Divider(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Bạn bè',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Text(
                        'Tìm bạn bè',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.blueAccent),
                      ),
                      onPressed: () {
                        _FriendsRequest();
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '362 người bạn',
                      style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0),
            height: 350.0,
            child: GridView(
              physics: new NeverScrollableScrollPhysics(),
              children: FAKE_FRIENDS
                  .map((eachFriend) => FriendItem(friends: eachFriend))
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.33,
                  childAspectRatio: 7 / 9,
                  // crossAxisSpacing: 0.0,
                  mainAxisSpacing: 10),
            ),

            // child: GridView.count(
            //   padding: const EdgeInsets.all(17),
            //   crossAxisSpacing: 15,
            //   mainAxisSpacing: 30,
            //   crossAxisCount: 3,
            //   children: FAKE_FRIENDS
            //       .map((eachFriend) => FriendItem(friends: eachFriend))
            //       .toList(),
            // ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: FlatButton(
              color: Color.fromARGB(109, 192, 195, 195),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              minWidth: MediaQuery.of(context).size.width * 0.91,
              child: Text('Xem tất cả bạn bè'),
              onPressed: () {
                _ViewAllFriends();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 20.0),
            child: Divider(
              height: 20.0,
              thickness: 10.0,
              color: Color.fromARGB(120, 139, 141, 141),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Bài viết',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                FlatButton(
                  height: 60.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg')),
                            border:
                                Border.all(color: Colors.white, width: 1.0)),
                      ),
                      Text('Bạn đang nghĩ gì?',
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.black54)),
                    ],
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0.0, 0, 20.0),
            child: Divider(
              height: 20.0,
              color: Color.fromARGB(120, 139, 141, 141),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 20.0),
            child: Divider(
              height: 20.0,
              thickness: 10.0,
              color: Color.fromARGB(120, 139, 141, 141),
            ),
          )
        ],
      ),
    );
  }

  void _personalPageSetting() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            duration: Duration(milliseconds: 130),
            child: new Scaffold(
              appBar: new AppBar(
                leading: BackButton(
                  color: Colors.black,
                ),
                title: new Text(
                  'Cài đặt trang cá nhân',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
              ),
              body: new Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      _EditProfile();
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.edit_outlined),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Chỉnh sửa trang cá nhân',
                          style: TextStyle(fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 15.0,
                    color: Color.fromARGB(120, 139, 141, 141),
                  ),
                  FlatButton(
                    onPressed: () {
                      _SearchOnProfilePage();
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search_rounded),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Tìm kiếm trên trang cá nhân',
                          style: TextStyle(fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                    color: Color.fromARGB(120, 139, 141, 141),
                    thickness: 10.0,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 17.0, top: 10.0),
                    child: Text(
                      'Liên kết đến trang cá nhân của bạn',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 17.0, top: 10.0, bottom: 5.0),
                    child: Text('Liên kết của riêng bạn trên FaceBook.'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Divider(
                      height: 10.0,
                      color: Color.fromARGB(120, 139, 141, 141),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 17.0, bottom: 5.0),
                    child: Text(
                      'https://www.facebook.com/user',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 17.0, bottom: 5.0),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.black)),
                        child: Text('Sao chép liên kết'),
                      )),
                ],
              ),
            )));
  }

  void _EditProfile() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            duration: Duration(milliseconds: 130),
            child: new Scaffold(
              appBar: new AppBar(
                leading: BackButton(
                  color: Colors.black,
                ),
                title: new Text(
                  'Chỉnh sửa trang cá nhân',
                  style: TextStyle(color: Colors.black, fontSize: 19.0),
                ),
                backgroundColor: Colors.white,
              ),
              body: new ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ảnh đại diện',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Chỉnh sửa',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg')),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 15.0, top: 10.0, bottom: 5.0),
                          child: Divider(
                            height: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ảnh bìa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Chỉnh sửa',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15.0, top: 10.0),
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg')),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 15.0, top: 10.0, bottom: 5.0),
                          child: Divider(
                            height: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chi tiết',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Chỉnh sửa',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(2.0, 5.0, 15.0, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.work),
                                  SizedBox(width: 12.0),
                                  Text(
                                    'Publisher tại ',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.house),
                                  SizedBox(width: 12.0),
                                  Text(
                                    'Sống tại ',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    'New York, Florida',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.school),
                                  SizedBox(width: 12.0),
                                  Text(
                                    'Học Quản trị kinh doanh tại ',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    'Harvard University',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 12.0),
                                  Text(
                                    'Đến từ ',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    'Hà Nội, Hà Nội, Việt Nam',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 15.0, top: 10.0, bottom: 1.0),
                          child: Divider(
                            height: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sở thích',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Thêm',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 15.0, top: 1.0, bottom: 1.0),
                          child: Divider(
                            height: 15.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Liên kết',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Thêm',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 15.0, top: 1.0, bottom: 5.0),
                          child: Divider(
                            height: 15.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: RaisedButton.icon(
                            elevation: 0,
                            onPressed: () {
                              print('Click chỉnh sửa thông tin giới thiệu');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            label: Text(
                              'Chỉnh sửa thông tin giới thiệu',
                              style: TextStyle(color: Colors.blue),
                            ),
                            icon: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.blue,
                            ),
                            textColor: Colors.blue,
                            color: Color.fromARGB(205, 200, 223, 247),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  void _SearchOnProfilePage() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            duration: Duration(milliseconds: 130),
            child: new Scaffold(
              appBar: new AppBar(
                leading: BackButton(
                  color: Colors.black,
                ),
                // actions: [searchBar.getSearchAction(context)],
                // actions: [SearchBar(
                //     inBar: false,
                //     setState: setState,
                //     onSubmitted: print,
                // ).getSearchAction(context)],
                backgroundColor: Colors.white,
              ),
              body: new ListView(
                children: [
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg')),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      'Bạn đang tìm gì à?',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 65.0, left: 65.0, top: 20.0),
                    child: Text(
                      'Tìm kiếm trên trang cá nhân của THE MATRIX để xem bài viết, ảnh và các hoạt động hiển thị khác.',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )));
  }

  void _ViewAllFriends() {
    bool activeAllFriend = true;
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            duration: Duration(milliseconds: 130),
            child: new Scaffold(
                appBar: new AppBar(
                  leading: BackButton(
                    color: Colors.black,
                  ),
                  title: Text(
                    'THE MATRIX',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.search_rounded),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () {},
                    )
                  ],
                  backgroundColor: Colors.white,
                ),
                body: new Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 15.0, left: 15.0, top: 12.0, bottom: 15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  FlatButton(
                                    child: Text(
                                      'Tất cả',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        activeAllFriend = !activeAllFriend;
                                      });
                                    },
                                    color: activeAllFriend == true
                                        ? Color.fromARGB(200, 200, 223, 247)
                                        : Color.fromARGB(100, 192, 195, 195),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0))),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Column(
                                children: [
                                  FlatButton(
                                    child: Text(
                                      'Gần đây',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        activeAllFriend = !activeAllFriend;
                                      });
                                      print(activeAllFriend);
                                    },
                                    color: activeAllFriend == true
                                        ? Color.fromARGB(100, 192, 195, 195)
                                        : Color.fromARGB(200, 200, 223, 247),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0))),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 40.0,
                            margin: EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(50, 192, 195, 195),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 14),
                                hintText: 'Tìm kiếm bạn bè',
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text(
                                '362 người bạn',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView(
                        children: FAKE_FRIENDS
                            .map((eachFriend) => FriendItemViewAll(
                                friend_item_ViewAll: eachFriend))
                            .toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width * 1,
                            childAspectRatio: 8 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                      ),
                    )
                  ],
                ))));
  }

  void _FriendsRequest() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            duration: Duration(milliseconds: 130),
            child: new Scaffold(
                appBar: new AppBar(
                  leading: BackButton(
                    color: Colors.black,
                  ),
                  title: Text(
                    'Lời mời kết bạn',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.more_horiz_rounded),
                      onPressed: () {
                        showModalBottomSheet<void>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: 70,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: FlatButton(
                                              height: 60.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_outlined,
                                                    size: 35.0,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.75,
                                                    child: Text(
                                                        'Xem lời mời đã gửi',
                                                        style: TextStyle(
                                                            fontSize: 16.0)),
                                                  )
                                                ],
                                              ),
                                              onPressed: () {},
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ));
                            });
                      },
                      color: Colors.black,
                    )
                  ],
                  backgroundColor: Colors.white,
                ),
                body: new Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 15.0, top: 12.0, bottom: 15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lời mời kết bạn',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              FlatButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: FlatButton(
                                                        height: 60.0,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .auto_awesome,
                                                              size: 35.0,
                                                            ),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.75,
                                                              child: Text(
                                                                  'Mặc định',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0)),
                                                            )
                                                          ],
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: FlatButton(
                                                        height: 60.0,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .arrow_upward_rounded,
                                                              size: 35.0,
                                                            ),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.75,
                                                              child: Text(
                                                                  'Lời mời mới nhất trước tiên',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0)),
                                                            )
                                                          ],
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: FlatButton(
                                                        height: 60.0,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .arrow_downward_rounded,
                                                              size: 35.0,
                                                            ),
                                                            SizedBox(
                                                              width: 10.0,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.75,
                                                              child: Text(
                                                                  'Lời mời cũ nhất trước tiên',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0)),
                                                            )
                                                          ],
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ));
                                      });
                                },
                                child: Text(
                                  'Sắp xếp',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16.0),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView(
                        children: FAKE_FRIENDS
                            .map((eachFriend) => FriendRequestItem(
                                friend_request_item: eachFriend))
                            .toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width * 1,
                            childAspectRatio: 8 / 2.2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                      ),
                    )
                  ],
                ))));
  }
}
