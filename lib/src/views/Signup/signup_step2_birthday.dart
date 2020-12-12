import 'package:fakebook_flutter_app/src/models/user.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/utils/time_ext.dart';

class SignupBirthday extends StatefulWidget {
  UserModel userInput;

  @override
  _SignupBirthdayState createState() => _SignupBirthdayState();
}

class _SignupBirthdayState extends State<SignupBirthday> {
  String birthday =
      DateTime.now().getPre().subtract(Duration(days: 1)).toString();

  @override
  Widget build(BuildContext context) {
    UserModel userInput = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Ngày sinh',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: Text(
                  "Sinh nhật của bạn khi nào?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 150,
              child: CupertinoDatePicker(
               // minimumYear: DateTime.
                mode: CupertinoDatePickerMode.date,
                initialDateTime:
                    DateTime.now().getPre().subtract(Duration(days: 1)),
                maximumDate: DateTime.now().getPre(),
                onDateTimeChanged: (DateTime newDateTime) {
                  birthday = newDateTime.toString();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  onPressed: () {
                    userInput.birthday = birthday;
                    Navigator.pushNamed(context, "signup_step3",
                        arguments: userInput);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all((Radius.circular(8)))),
                  color: Colors.blue,
                  child: Text(
                    "Tiếp tục",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}