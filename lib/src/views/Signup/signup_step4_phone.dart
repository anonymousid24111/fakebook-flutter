import 'package:fakebook_flutter_app/src/helpers/validator.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:flutter/material.dart';

class SignupPhone extends StatefulWidget {
  @override
  _SignupPhoneState createState() => _SignupPhoneState();
}

class _SignupPhoneState extends State<SignupPhone> {

  var _isTextNull = null;

  TextEditingController _phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserModel userInput = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Số di động',
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 0, 45),
                child: Text(
                  "Nhập số di động của bạn",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                onChanged: (text) {
                  setState(() {
                    _isTextNull = text.isEmpty;
                  });
                },
                controller: _phoneController,
                autofocus: true,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Số điện thoại",
                    errorText: _isTextNull == null || !_isTextNull || Validators.isValidPhone(_phoneController.text)
                        ? null
                        : "Vui lòng nhập một số di động hợp lệ",
                    suffixIcon: Visibility(
                      visible: _isTextNull == null ? true : !_isTextNull,
                      child: new GestureDetector(
                        onTap: () {
                          _phoneController.text = '';
                        },
                        child: new Icon(Icons.close),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelStyle:
                        TextStyle(color: Color(0xff888888), fontSize: 15)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    onPressed: () {
                      if (_isTextNull == null || _isTextNull ) {
                        setState(() {
                          _isTextNull = true;
                        });
                      } else {
                        userInput.phone = _phoneController.text;
                        Navigator.pushNamed(context, "signup_step5",
                            arguments: userInput);
                      }
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
      ),
    );
  }
}
