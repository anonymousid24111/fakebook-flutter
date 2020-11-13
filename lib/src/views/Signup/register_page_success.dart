
import 'package:fakebook_flutter_app/src/models/user.dart';
import 'package:fakebook_flutter_app/src/ultils/app_icons.dart';
import 'package:fakebook_flutter_app/src/views/Signup//register_page_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RegisterPageSuccess extends StatefulWidget {
  UserModel _user;

  RegisterPageSuccess(this._user);

  @override
  State<StatefulWidget> createState() => _RegisterPageState(_user);
}

class _RegisterPageState extends State<RegisterPageSuccess>
    with TickerProviderStateMixin {
  UserModel _user;

  _RegisterPageState(this._user);


  AnimationController _breathingController;
  var _breathe = 0.0;
  var count = 0;

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _breathingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathingController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _breathingController.forward();
      }
    });

    _breathingController.addStatusListener((status) {
      setState(() {
        _breathe = _breathingController.value;
        if (_breathingController.duration.inMilliseconds == 1000)
          count++;
      });
    });

    _breathingController.forward();
  }

  Widget build(BuildContext context) {
    final size = 100.0 - 50.0 * _breathe;
    print(count);
    if (count >= 10) {
      _breathingController.dispose();
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(
                builder: (context) => RegisterPageSave(_user)),
                (route) => false);
      });
      count = 0;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          'Tạo tài khoản thành công',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Visibility(
        visible: true,
        child: Center(
          child: Container(
            height: size,
            width: size,
            child: Icon(
              AppIcons.thumbs_up_alt,
              size: size - 20,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
