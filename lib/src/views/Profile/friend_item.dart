import 'package:flutter/material.dart';
import './models/friends.dart';

class FriendItem extends StatelessWidget {
  Friends friends;
  FriendItem({this.friends});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // final item = this.friends.image;
    return Column(
      children: [
        Container(
          // width: MediaQuery.of(context).size.width * 0.27,
          height: 105.0,
          width: 105.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  fit: BoxFit.cover, image: this.friends.image)),
          child: FlatButton(
            onPressed: () {
              print(this.friends.name);
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: FlatButton(
            onPressed: (){print(this.friends.name);},
            child: Text(this.friends.name),
          ),
        )
      ],
    );
  }
}
