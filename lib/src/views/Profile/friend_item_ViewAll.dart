import 'package:flutter/material.dart';
import './models/friends.dart';

class FriendItemViewAll extends StatelessWidget{
  Friends friend_item_ViewAll;
  FriendItemViewAll({this.friend_item_ViewAll});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: (){print(this.friend_item_ViewAll.name);},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(left: 15.0),
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: this.friend_item_ViewAll.image),
                    ),
                  ),
                  SizedBox(width: 12.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(this.friend_item_ViewAll.name,textAlign: TextAlign.start,style: TextStyle(fontSize: 16.0),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text('90 bạn chung',textAlign: TextAlign.start,style: TextStyle(fontSize: 14.0, color: Colors.black54),),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: (){showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return  Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                height: 60.0,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.people_alt_rounded,size: 35.0,),
                                    SizedBox(width: 10.0,),
                                    Container(
                                        width:MediaQuery.of(context).size.width * 0.75 ,
                                      child: Text('Xem bạn bè của ${this.friend_item_ViewAll.name}', style: TextStyle(fontSize: 16.0)),
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                height: 60.0,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.message_rounded,size: 35.0,),
                                    SizedBox(width: 10.0,),
                                    Container(
                                        width:MediaQuery.of(context).size.width * 0.75 ,
                                        child: Text('Nhắn tin cho ${this.friend_item_ViewAll.name}', style: TextStyle(fontSize: 16.0)),
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                height: 60.0,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.person_search_rounded,size: 35.0,),
                                    SizedBox(width: 10.0,),
                                    Container(
                                      width:MediaQuery.of(context).size.width * 0.75 ,
                                      child: Text('Xem trang cá nhân của ${this.friend_item_ViewAll.name}', style: TextStyle(fontSize: 16.0)),
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                height: 60.0,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.block_rounded,size: 35.0,),
                                    SizedBox(width: 10.0,),
                                    Column(
                                      children: [
                                        Container(
                                          width:MediaQuery.of(context).size.width * 0.75 ,
                                          child: Text('Chặn ${this.friend_item_ViewAll.name}', style: TextStyle(fontSize: 16.0)),
                                        ),
                                        Container(
                                          width:MediaQuery.of(context).size.width * 0.75 ,
                                          child: Text('${this.friend_item_ViewAll.name} sẽ không thể nhìn thấy bạn hoặc liên hệ với bạn trên Facebook', style: TextStyle(fontSize: 13.0,color: Colors.black54)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 3.0,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                height: 60.0,
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.person_remove_rounded,size: 35.0,),
                                    SizedBox(width: 10.0,),
                                    Column(
                                      children: [
                                        Container(
                                          width:MediaQuery.of(context).size.width * 0.75 ,
                                          child: Text('Huỷ kết bạn với ${this.friend_item_ViewAll.name}', style: TextStyle(fontSize: 16.0,color: Colors.red)),
                                        ),
                                        Container(
                                          width:MediaQuery.of(context).size.width * 0.75 ,
                                          child: Text('Xoá ${this.friend_item_ViewAll.name} khỏi danh sách bạn bè', style: TextStyle(fontSize: 13.0,color: Colors.black54)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        )
                      ],
                    );

                });},
            icon: Icon(Icons.more_horiz_rounded),
          )
        ],
      ),
    );
  }
}