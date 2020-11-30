import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/loading_dialog.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/views/Login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ExistUserLogin extends StatefulWidget {
  @override
  _ExistUserLoginState createState() => _ExistUserLoginState();
}

class _ExistUserLoginState extends State<ExistUserLogin> {
  TextEditingController textController = new TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  LoginController loginController = new LoginController();

  bool isKeyboardOpen = false;
  String username;
  String password = '';
  bool showPass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StorageUtil.getUsername().then((value) => setState(() {
          username = value;
        }));
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: kColorWhite,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                    ? SizedBox.shrink()
                    : SizedBox(height: 180),
                CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(username ?? "hihi"),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: kColorGrey, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: TextField(
                    controller: textController,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: !showPass,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mật khẩu",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Visibility(
                        visible: password.isNotEmpty,
                        child: new GestureDetector(
                          onTap: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          child: new Icon(showPass
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FlatButton(
                    onPressed: password.isEmpty
                        ? null
                        : () async {
                            try {
                              Dialogs.showLoadingDialog(context, _keyLoader,
                                  "Đang đăng nhập..."); //invoking login

                              var result = await loginController.onSubmitLogIn(
                                  phone: await StorageUtil.getPhone(), password: textController.text);

                              Navigator.of(_keyLoader.currentContext,
                                      rootNavigator: true)
                                  .pop(); //close the dialoge

                              if (result != '') {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    result, (Route<dynamic> route) => false);
                                //loginController.dispose();
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            Text("Đăng nhập không thành công"),
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
                          },
                    disabledTextColor: Colors.grey[400],
                    textColor: kColorWhite,
                    disabledColor: Colors.blue,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    child: Text("Đăng nhập")),
                SizedBox(height: 40),
                Text(
                  "Quên mật khẩu?",
                  style:
                      TextStyle(color: kColorBlue, fontWeight: FontWeight.w600),
                ),
                //Expanded(child: SizedBox(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}