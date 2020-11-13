import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:flutter/cupertino.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    StorageUtil.setUuid();

    delay().then((viewLink) {
      Navigator.pushNamed(context, viewLink);
    });
  }

  Future<String> delay() async {
    String viewLink = 'login_screen';
    StorageUtil.getIsLogging().then((result) async {
      if (result == false) {
        viewLink = 'login_screen';
      } else {
        viewLink = 'login_screen';
      }
    });
    await Future.delayed(Duration(seconds: 3));
    return viewLink;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          //color: Colors.black26,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/facebook_logo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
