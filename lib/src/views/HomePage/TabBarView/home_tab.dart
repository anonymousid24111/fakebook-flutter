import 'package:fakebook_flutter_app/src/widgets/write_something_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/separator_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/post_widget.dart';
import 'package:fakebook_flutter_app/src/models/post1.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          WriteSomethingWidget(),
          SeparatorWidget(),
          for(Post post in posts) Column(
            children: <Widget>[
              SeparatorWidget(),
              PostWidget(post: post),
            ],
          ),
          SeparatorWidget(),
        ],
      ),
    );
  }
}