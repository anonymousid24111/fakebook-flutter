import 'package:fakebook_flutter_app/src/widgets/base_widget.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step1_name.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  UserModel userInput = new UserModel.empty();
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Tạo tài khoản',
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
              buildImage(),
              buildTextTop(),
              buildTextBottom(),
              buildExistsAccount()
            ],
          ),
        ),
      ),
    );
  }

  Padding buildExistsAccount() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 210, 0, 0),
      child: buildTextPress("Bạn đã có tài khoản?", Colors.blue),
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
            "Tiếp",
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
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            Text(
              "Chúng tôi sẽ giúp bạn tạo tài khoản mới sau một vài bước",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            buildButtonContinue()
          ],
        ),
      ),
    );
  }

  Text buildTextTop() {
    return Text(
      "Tham gia facebook",
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Center buildImage() {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.width / 1.5,
          padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Image.asset('assets/image_signup.png')),
    );
  }

  onContinueClick() {
    print(widget.userInput.id="123");
    Navigator.pushNamed(context, "signup_step1",arguments: widget.userInput);
  }
}
