import 'package:fakebook_flutter_app/src/base/base_widget.dart';
import 'package:fakebook_flutter_app/src/helpers/TextStyle.dart';
import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/connect.dart';
import 'package:fakebook_flutter_app/src/helpers/screen.dart';
import 'package:fakebook_flutter_app/src/views/Login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/ultils/context_ext.dart';
import '../HomePage/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const ACTION_LOGIN = "login";
  bool _showPass = false;
  LoginController loginController = new LoginController();
  String _phone = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                buildTopBackground(),
                buildUserInput(),
                buildPasswordInput(),
                buildButtonSignIn(),
                buildForgotPassword(),
                buildDeliver(context),
                buildButtonSignUp()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonSignUp() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: SizedBox(
        child: Wrap(children: [
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "signup_screen");
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all((Radius.circular(8)))),
            color: Colors.green,
            child: Text(
              "Tạo tài khoản facebook mới",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ]),
      ),
    );
  }

  GestureDetector buildForgotPassword() {
    return buildTextPress("Quên mật khẩu", Colors.blue);
  }

  Widget buildDeliver(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          width: MediaQuery.of(context).size.width / 2 - 50,
          height: 1,
          color: Colors.grey,
        ),
        Text("HOẶC"),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 50,
          height: 1,
          color: Colors.grey,
        ),
      ]),
    );
  }

  Widget buildButtonSignIn() {
    return StreamBuilder(
      stream: loginController.btnLoadingStream,
      builder: (context, snapshot) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all((Radius.circular(8)))),
                color: Colors.blue,
                child: buildLoginChild(snapshot.hasData?snapshot.data:true),
                onPressed: () async {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  var result = await loginController.onSubmitLogIn(
                      phone: _phone, password: _password);

                  if (result != '') {
                    Navigator.pushNamedAndRemoveUntil(context, result,
                        (Route<dynamic> route) => false);
                    loginController.dispose();
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StreamBuilder(
                              stream: loginController.loginStream,
                              builder: (context, snapshot) {
                                return AlertDialog(
                                  title: Text("Đăng nhập không thành công"),
                                  content: Text(snapshot.hasData
                                      ? snapshot.data
                                      : "hehe"),
                                );
                              });
                        });
                  }
                },
              ),
            ));
      },
    );
  }

  Widget buildPasswordInput() {
    return StreamBuilder(
        stream: loginController.passwordStream,
        builder: (context, snapshot) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextField(
                onChanged: (value) {
                  _password = value;
                },
                style: TextStyle(fontSize: 18, color: Colors.black),
                obscureText: !_showPass,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.lock_outline, color: Color(0xff888888)),
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                  errorText: snapshot.hasError ? snapshot.error : "",
                  suffixIcon: Visibility(
                    visible: snapshot.hasData,
                    child: new GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPass = !_showPass;
                        });
                      },
                      child: new Icon(
                          _showPass ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ));
        });
  }

  Widget buildUserInput() {
    return StreamBuilder(
        stream: loginController.phoneStream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: TextField(
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                labelText: "Số điện thoại hoặc email",
                prefixIcon: Icon(Icons.person, color: Color(0xff888888)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                errorText: snapshot.hasError ? snapshot.error : "",
              ),
              onChanged: (value) {
                _phone = value;
              },
            ),
          );
        });
  }

  Container buildTopBackground() {
    return Container(
      child: Image.asset('assets/top_background.jpg'),
    );
  }

  Widget buildLoginChild(bool value) {
    if (!value) {
      return const CircularProgressIndicator();
    } else {
      return FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'Đăng nhập',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),
        ),
      );
    }
  }

  /*
  void onSignInClicked(AsyncSnapshot<dynamic> value) async {
    bool isAvailableConnect = await isAvailableInternet();
    print(value.error);
    if (isAvailableConnect) {
      if (value.isValidInfo()) {
        final s = value.login().doOnListen(() {}).doOnDone(() {}).listen(
          (_) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          onError: (e) => value.dispatchFailure(e.code),
        );
        value.addSubscription(s);
      }
    } else {
      context.showToast("Không có kết nối Internet!");
    }
  }
   */

  @override
  void onClick(String action) {
    if (ACTION_LOGIN == action) {
      // onSignInClicked();
    }
  }
}
