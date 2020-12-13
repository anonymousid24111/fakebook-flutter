import 'dart:convert';

import 'package:fakebook_flutter_app/main.dart';
import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/loading_dialog.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/views/Login/login_controller.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class LoggedUser extends StatefulWidget {
  @override
  _LoggedUserState createState() => _LoggedUserState();
}

class _LoggedUserState extends State<LoggedUser> with RouteAware {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  LoginController loginController = new LoginController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScaffoldState scaffold;

  String username;
  String avatar;
  String password;

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

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => routeObserver.subscribe(this, ModalRoute.of(context)));

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context).settings.arguments == "home_screen") {
        Flushbar(
          message: "Đăng xuất thành công",
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    StorageUtil.getPassword().then((value) => password = value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  margin: EdgeInsets.only(top: 150, bottom: 30),
                  child: Image.asset(
                    'assets/facebook_logo.png',
                    height: 65,
                  )),
              FlatButton(
                onPressed: () async {
                  if (password != null) {
                    try {
                      Dialogs.showLoadingDialog(context, _keyLoader,
                          "Đang đăng nhập..."); //invoking login
                      var result = await loginController.onSubmitLogIn(
                          phone: await StorageUtil.getPhone(),
                          password: await StorageUtil.getPassword());
                      Navigator.of(_keyLoader.currentContext,
                              rootNavigator: true)
                          .pop();
                      if (result != '') {
                        Navigator.pushNamedAndRemoveUntil(
                            context, result, (Route<dynamic> route) => false);
                        //loginController.dispose();
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Đăng nhập không thành công"),
                                content: Text(loginController.error),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"))
                                ],
                              );
                            });
                      }
                    } catch (error) {
                      print(error);
                    }
                  } else
                    Navigator.pushNamed(context, 'existeduser_login_screen');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: kColorGrey,
                        radius: 35.0,
                        backgroundImage: avatar == null
                            ? AssetImage('assets/avatar.jpg')
                            : NetworkImage(avatar),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                        username ?? "Người dùng Fakebook",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                      Container(
                        child: PopupMenuButton(
                          onSelected: (index) async {
                            print(index);
                            switch (index) {
                              case 'remove_password':
                                {
                                  setState(() {
                                    StorageUtil.deletePassword();
                                  });
                                }
                                break;
                              case 'remove_account':
                                {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          title: Text(
                                              "Gỡ tài khoản khỏi thiết bị"),
                                          content: Text(
                                              "Bạn cần nhập số điện thoại hoặc email vào lần đăng nhập sau"),
                                          actions: [
                                            FlatButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "HỦY",
                                                  style: TextStyle(
                                                      color: kColorBlack),
                                                )),
                                            FlatButton(
                                                onPressed: () {
                                                  StorageUtil.clear();
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          'login_screen',
                                                          (Route<dynamic>
                                                                  route) =>
                                                              false);
                                                },
                                                child: Text(
                                                  "GỠ TÀI KHOẢN",
                                                  style: TextStyle(
                                                      color: kColorBlue),
                                                ))
                                          ],
                                        );
                                      });
                                }
                                break;
                              case 'turnoff_notis':
                                {}
                                break;
                            }
                          },
                          offset: Offset(500, 1000),
                          elevation: 3.2,
                          onCanceled: () {
                            print('You have not chossed anything');
                          },
                          tooltip: 'Thêm',
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            if (password != null)
                              PopupMenuItem<String>(
                                child: new Text('Gỡ mật khẩu'),
                                value: 'remove_password',
                              ),
                            PopupMenuItem<String>(
                              child: new Text('Gỡ tài khoản khỏi thiết bị'),
                              value: 'remove_account',
                            ),
                            PopupMenuItem<String>(
                                child: new Text('Tắt thông báo đẩy'),
                                value: 'turnoff_notis'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login_screen');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Row(
                    children: [
                      DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFe0e0e0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          )),
                      SizedBox(width: 10),
                      Text(
                        "Đăng nhập bằng tài khoản khác",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Row(
                    children: [
                      DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFe0e0e0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.blue,
                          )),
                      SizedBox(width: 10),
                      Text(
                        "Tìm tài khoản",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      color: Color(0xFFe0e0e0),
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        "TẠO TÀI KHOẢN FACEBOOK MỚI",
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'signup_screen');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didPush() {
    print('didPush FirstPage');
  }

  @override
  void didPopNext() {
    print('didPopNext FirstPage');
  }

  @override
  void didPop() {
    print('didPop FirstPage');
  }

  @override
  void didPushNext() {
    print('didPushNext FirstPage');
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
