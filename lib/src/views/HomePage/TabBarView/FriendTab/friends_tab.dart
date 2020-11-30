import 'package:flutter/material.dart';

class FriendsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bạn bè', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Text('Gợi ý', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                ),

                SizedBox(width: 10.0),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Text('Tất cả bạn bè', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                )
              ],
            ),

            Divider(height: 30.0),

            Row(
              children: <Widget>[
                Text('Lời mời kết bạn', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),

                SizedBox(width: 10.0),

                Text('8', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, color: Colors.red)),
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Trí Minh', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Mạnh', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Dinh Quang Dat', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Đức Giang', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Phạm Huy', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Thành', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Linh', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Vượng', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            Divider(height: 30.0),

            Text('Những người bạn có thể biết', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('People 1', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('People 2', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('People 3', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('People 4', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('People 5', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 20.0),

            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 40.0,
                ),
                SizedBox(width: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('People 6', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Chấp nhận', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text('Xóa ', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20.0)
          ],
        )
      ),
    );
  }
}