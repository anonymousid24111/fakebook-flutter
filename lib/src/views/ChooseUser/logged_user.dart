

import 'package:flutter/material.dart';

class LoggedUser extends StatefulWidget {
  @override
  _LoggedUserState createState() => _LoggedUserState();
}

class _LoggedUserState extends State<LoggedUser> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  margin: EdgeInsets.only(top: 200),
                  child: Image.asset(
                    'assets/facebook_logo.png',
                    height: 65,
                  )),
              FlatButton(
                onPressed: (){print("hello 1");},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          'assets/avatar.jpg',
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                            "Hieu Joey",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      Container(
                        child: PopupMenuButton(
                          onSelected: (index){
                            print(index);
                          },
                          offset: Offset(500, 1000),
                          elevation: 3.2,
                          onCanceled: () {
                            print('You have not chossed anything');
                          },
                          tooltip: 'Thêm',
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            new PopupMenuItem<String>(
                              child: new Text('Gỡ tài khoản khỏi thiết bị'), value: 'logout', ),
                            new PopupMenuItem<String>(
                                child: new Text('Tắt thông báo đẩy'), value: 'disablepush'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Row(
                    children: [
                      DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFe0e0e0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.blue,
                          )),
                      SizedBox(width: 10),
                      Text(
                        "Đăng nhập bằng tài khoản khác",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Row(
                    children: [
                      DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFe0e0e0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.blue,
                          )),
                      SizedBox(width: 10),
                      Text(
                        "Tìm tài khoản",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                      color: Color(0xFFe0e0e0),
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Text("TẠO TÀI KHOẢN FACEBOOK MỚI", style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),),
                      onPressed: () {},
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