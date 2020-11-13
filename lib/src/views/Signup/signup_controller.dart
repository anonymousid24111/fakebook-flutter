import 'dart:async';
import 'package:fakebook_flutter_app/src/models/user.dart';


import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';

class RegisterBloc {

  StreamController _emailController = StreamController.broadcast();

  Stream get emailStream => _emailController.stream;

  void signUp(UserModel user, Function onSuccess, Function onError, String code) {
      _onSignUpErr(code);
  }

  void _onSignUpErr(String code) {
    switch (code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
        _emailController.sink.addError("Email đã tồn tại");
        break;
      default:
    }
  }

  void dispose() {
    _emailController.close();
  }
}
