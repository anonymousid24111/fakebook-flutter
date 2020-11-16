import 'package:fakebook_flutter_app/src/widgets/base_widget.dart';
import 'package:fakebook_flutter_app/src/helpers/TextStyle.dart';
import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/connect.dart';
import 'package:fakebook_flutter_app/src/helpers/screen.dart';
import 'package:fakebook_flutter_app/src/views/Login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/ultils/context_ext.dart';
import '../HomePage/home_page.dart';
import 'login_loading.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

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
                Container(
                  //padding: EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset('assets/top_background.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    //cursorHeight: 30,
                    decoration: InputDecoration(
                      hintText: "Số điện thoại hoặc email",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.blue,
                      //labelText: "Số điện thoại hoặc email",
                      prefixIcon: Icon(Icons.person, color: Color(0xff888888)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _phone = value;
                      });
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                        hintText: "Mật khẩu",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Color(0xff888888)),
                        suffixIcon: Visibility(
                          visible: _password.isNotEmpty,
                          child: new GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPass = !_showPass;
                              });
                            },
                            child: new Icon(_showPass
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    )),
                 Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all((Radius.circular(8)))),
                                color: Colors.blue,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Đăng nhập',
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: _phone.isEmpty || _password.isEmpty
                                    ? null
                                    : () async {
                                        try {
                                          Dialogs.showLoadingDialog(context,
                                              _keyLoader); //invoking login

                                          var result = await loginController
                                              .onSubmitLogIn(
                                                  phone: _phone,
                                                  password: _password);

                                          Navigator.of(
                                              _keyLoader.currentContext,
                                              rootNavigator: true)
                                              .pop();//close the dialoge

                                          if (result != '') {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                result,
                                                (Route<dynamic> route) =>
                                                    false);
                                            //loginController.dispose();
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Đăng nhập không thành công"),
                                                    content: Text(loginController.error),
                                                    actions: [
                                                      FlatButton(
                                                          onPressed: () {
                                                            print(context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("OK"))
                                                    ],
                                                  );
                                                });
                                          }
                                        } catch (error) {
                                          print(error);
                                        }
                                      }
/*
                                        FutureBuilder<String>(
                                          future: loginController.onSubmitLogIn(
                                              phone: _phone, password: _password),
                                          builder: (context, snapshot) {
                                            Widget child;
                                            if (snapshot.connectionState == ConnectionState.none &&
                                                snapshot.hasData == null) {
                                              return Container();
                                            }

                                            if (snapshot.hasData) {
                                              return Scaffold(body: Text(snapshot.data));
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  snapshot.data,
                                                  (Route<dynamic> route) => false);
                                            } else if (snapshot.hasError) {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "Đăng nhập không thành công"),
                                                      content: Text("hehe"),
                                                    );
                                                  });
                                            }
                                            else child = Center(child: Text("hi ae"),);

                                            return child;
                                          },
                                        );


 */
                                /*
                                  var result = await loginController.onSubmitLogIn(
                                      phone: _phone, password: _password);

                                  if (result != '') {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        result, (Route<dynamic> route) => false);
                                    loginController.dispose();
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StreamBuilder(
                                              stream: loginController.loginStream,
                                              builder: (context, snapshot) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Đăng nhập không thành công"),
                                                  content: Text(snapshot.hasData
                                                      ? snapshot.data
                                                      : "hehe"),
                                                );
                                              });
                                        });
                                  }



                                   */
                                //  },
                                ),
                          )),

                   // }),


                buildTextPress("Quên mật khẩu", Colors.blue),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: SizedBox(
                      child: Wrap(children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "signup_screen");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all((Radius.circular(8)))),
                          color: Colors.green,
                          child: Text(
                            "Tạo tài khoản facebook mới",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
  @override
  void onClick(String action) {
    if (ACTION_LOGIN == action) {
      // onSignInClicked();
    }
  }

   */
}
