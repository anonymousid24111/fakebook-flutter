/*

import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:fakebook_flutter_app/src/helpers/progress_dialog.dart';
import 'package:fakebook_flutter_app/src//ultils/app_icons.dart';
import 'package:fakebook_flutter_app/src/views/Signup/register_page_save.dart';
import 'package:fakebook_flutter_app/src/views/Signup/register_page_step_6.dart';
import 'package:fakebook_flutter_app/src/views/Signup/register_page_success.dart';
import 'package:fakebook_flutter_app/src/views/Signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RegisterPageCreate extends StatefulWidget {
  UserModel _user;

  RegisterPageCreate(this._user);

  @override
  State<StatefulWidget> createState() => _RegisterPageState(_user);
}

class _RegisterPageState extends State<RegisterPageCreate>
    with TickerProviderStateMixin {
  UserEntity _user;
  RegisterBloc _registerBloc = RegisterBloc();

  _RegisterPageState(this._user);

  ProgressLoading dialog = ProgressLoading();

  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => callBack());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Đang tạo tài khoản',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(),
    );
  }

  callBack() {
      dialog.showLoading(context, "Đang tạo tài khoản...");
      _registerBloc.signUp(_user, () {
        dialog.hideLoading();
        Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(
                builder: (context) => RegisterPageSuccess(_user)),
                (route) => false);
      }, () {
        dialog.hideLoading();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterPageSix.origin(_user)));
        });
      });
    }
}


 */