/*

import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:fakebook_flutter_app/src/views/Signup/register_page_create.dart';
import 'package:fakebook_flutter_app/src/views/Signup/register_page_step_7.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/ultils/string_ext.dart';

class SignupEmail extends StatefulWidget {
  UserModel userInput;
  SignupEmail(this.userInput, {Key key}): super(key: key);

  @override
  _SignupEmailState createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {

  bool _isTextNull = true;
  TextEditingController _emailController = new TextEditingController();
  var errorText = null;
  RegisterBloc _registerBloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Địa chỉ email',
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
            children: [
              buildTextTop(),
              buildTexEmail(),
              buildButtonContinue(),
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

  Padding buildTextTop() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 45, 0, 45),
      child: Text(
        "Nhập địa chỉ email của bạn",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding buildTexEmail() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: StreamBuilder(
          builder: (context, snapshot) => TextField(
            textInputAction: TextInputAction.next,
            controller: _emailController,
            onChanged: (text) {
              setState(() {
                _isTextNull = text.isEmpty;
                if (!text.isEmpty && text.isValidEmail()) {
                  setState(() {
                    errorText = null;
                  });
                }
              });
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
                labelText: "Email",
                errorText: snapshot.hasError ? errorText : "Email đã tồn tại",
                suffixIcon: Visibility(
                  visible: !_isTextNull,
                  child: new GestureDetector(
                    onTap: () {
                      _emailController.text = '';
                      setState(() {
                        _isTextNull = true;
                      });
                    },
                    child: new Icon(_isTextNull ? null : Icons.close),
                  ),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15)),
          ),
          stream: _registerBloc.emailStream,
        ));
  }

  onContinueClick() {
    if (_emailController.text.isEmpty) {
      setState(() {
        errorText = "Không được để trống email";
      });
    } else if (!_emailController.text.isValidEmail()) {
      setState(() {
        errorText = "Email không hợp lệ";
      });
    } else if(user == null) {
      errorText = null;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterPageSeven(firstName, lastName,
                  birthday, gender, phone, _emailController.text)));
    } else{
      (user as UserModel).email = _emailController.text;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterPageCreate(user)));
    }
  }
}


 */