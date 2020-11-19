import 'package:fakebook_flutter_app/src/views/CreatePost/add_status_page.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  var returnStatus;
  bool can_post;
  TextEditingController _controller;

  void initState() {
    super.initState();

    returnStatus="";
    can_post = false;
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget Body() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            //_onBackPressed();
          },
        ),
        title: Text(
          "Tạo bài viết",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 6),
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: can_post
                  ? FlatButton(
                      minWidth: 1.2,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text(
                        "ĐĂNG",
                        style: TextStyle(color: Colors.black),
                      ))
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                        child: Text(
                          "ĐĂNG",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ))
        ],
        //bottom: PreferredSize(preferredSize: Size.fromHeight(4.0))
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage('assets/avatar.jpg'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hieu Joey",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                              returnStatus==""?SizedBox():Text(" - Đang cảm thấy "+returnStatus, ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.public,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                    Text("Công khai"),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                    Text("Album"),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  TextField(
                    //scrollController: ,
                    style: TextStyle(fontSize: 25),
                    cursorHeight: 35,
                    maxLines: null,
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Bạn đang nghĩ gì",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w300),
                    ),

                    onChanged: (String str) {
                      setState(() {
                        if (str.length == 0)
                          can_post = false;
                        else {
                          //print(str);
                          can_post = true;
                        }
                      });
                    },
                    onSubmitted: (String value) async {
                      await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Thanks!'),
                            content: Text('You typed "$value".'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          Container(
              height: 43,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Thêm vào bài viết của bạn")),
                  Icon(
                    Icons.image,
                    color: Colors.green,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  GestureDetector(
                      child: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.amber,
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatusPage()),
                    );
                  },),
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return can_post
        ? WillPopScope(
            onWillPop: _onBackPressed,
            child: Body(),
          )
        : Body();
  }
}
