import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:fakebook_flutter_app/src/helpers/constants.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/home_page.dart';
import 'package:flutter/material.dart';

class RegisterPageSave extends StatefulWidget {
  UserModel _user;

  RegisterPageSave(this._user);

  @override
  State<StatefulWidget> createState() => _RegisterPageSave(_user);
}

class _RegisterPageSave extends State<RegisterPageSave> {
  UserModel _user;

  _RegisterPageSave(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextTop(),
              buildTextOfTop(),
              buildText()
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextTop() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: Text(
        "Lưu thông tin đăng nhập của bạn",
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        maxLines: 1,
      ),
    );
  }

  Text buildTextOfTop() {
    return Text(
      "Lần tới khi đăng nhập vào điện thoại này bạn chỉ cần nhấn vào ảnh thay vì nhập mật khẩu",
      style: TextStyle(fontSize: 14, color: Colors.black),
      textAlign: TextAlign.center,
    );
  }

  Padding buildText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onContinueClick();
            },
            child: new Text(
              "Lúc khác",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          GestureDetector(
            onTap: () async {
              onContinueClick();
            },
            child: new Text(
              "Ok",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  onContinueClick() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
