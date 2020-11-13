import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_step2_birthday.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignupName extends StatefulWidget {

  @override
  _SignupNameState createState() => _SignupNameState();
}

class _SignupNameState extends State<SignupName> {
  var _isFirstNull=true;
  var _isSecondNull=true;
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserModel userInput = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Tên',
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
            children: [buildTextTop(), buildNameInput(), buildButtonContinue(userInput)],
          ),
        ),
      ),
    );
  }

  Padding buildButtonContinue(UserModel userInput) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: RaisedButton(
          onPressed: () => onContinueClick(userInput),
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

  Center buildTextTop() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 30),
        child: Text(
          "Bạn tên gì?",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  onContinueClick(UserModel userInput) {
    if (_isFirstNull || _isSecondNull){
      setState(() {
        _isFirstNull = true;
        _isSecondNull = true;
      });
    }
    else{
      userInput.firstName = _firstNameController.text;
      userInput.lastName = _lastNameController.text;
      print(userInput.id+" "+userInput.firstName+" "+userInput.lastName);
      Navigator.pushNamed(context, "signup_step2",arguments: userInput);
    }
  }

  Row buildNameInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 30),
            child: TextField(
              autofocus: true,
              onChanged: (text) {
                setState(() {
                  _isFirstNull = text.isEmpty;
                });
              },
              controller: _firstNameController,
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Họ",
                  suffixIcon: Visibility(
                    visible: _isFirstNull ? true : false,
                    child: new GestureDetector(
                      onTap: () {
                        _firstNameController.text = '';
                        setState(() {
                          _isFirstNull = true;
                        });
                      },
                      child: new Icon(Icons.close),
                    ),
                  ),
                  errorText: !_isFirstNull
                      ? null
                      : "Không được trống họ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  labelStyle:
                      TextStyle(color: Color(0xff888888), fontSize: 15)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
            child: TextField(
              controller: _lastNameController,
              onChanged: (text) {
                setState(() {
                  _isSecondNull = text.isEmpty;
                });
              },
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Tên",
                  suffixIcon: Visibility(
                    visible: _isSecondNull == null ? true : !_isSecondNull,
                    child: new GestureDetector(
                      onTap: () {
                        _lastNameController.text = '';
                        setState(() {
                          _isSecondNull = true;
                        });
                      },
                      child: new Icon(Icons.close),
                    ),
                  ),
                  errorText: _isSecondNull == null || !_isSecondNull
                      ? null
                      : "Không được trống tên",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  labelStyle:
                      TextStyle(color: Color(0xff888888), fontSize: 15)),
            ),
          ),
        ),
      ],
    );
  }
}
