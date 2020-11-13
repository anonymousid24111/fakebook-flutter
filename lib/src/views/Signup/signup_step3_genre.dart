import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step4_phone.dart';
import 'package:flutter/material.dart';


class SignupGenre extends StatefulWidget {
  UserModel userInput;
  SignupGenre(this.userInput, {Key key}): super(key: key);

  @override
  _SignupGenreState createState() => _SignupGenreState();
}

class _SignupGenreState extends State<SignupGenre> {

  String _character = 'Nam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Giới tính',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTextTop(),
              buildTextBottom(),
              RadioListTile<String>(
                //checked: true,
                title: const Text('Nam'),
                value: "Nam",
                groupValue: _character,
                onChanged: (String value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey,
              ),
              RadioListTile<String>(
                title: const Text('Nữ'),
                value: "Nữ",
                groupValue: _character,
                onChanged: (String value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              buildButtonContinue()
            ],
          ),
        ),
      ),
    );
  }

  Padding buildButtonContinue() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: RaisedButton(
          onPressed: onContinueClick,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all((Radius.circular(8)))),
          color: Colors.blue,
          child: Text(
            "Tiếp tục",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Align buildTextBottom() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Về sau, bạn có thể thay đổi những ai thấy giới",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              " tính của mình trên trang cá nhân",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildTextTop() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text(
        "Giới tính của bạn là gì?",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  onContinueClick() {
    widget.userInput.genre=_character;
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => SignupPhone(widget.userInput)));
  }
}
