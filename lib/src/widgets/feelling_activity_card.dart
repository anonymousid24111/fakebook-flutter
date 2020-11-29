import 'package:fakebook_flutter_app/src/views/CreatePost/add_status_page.dart';
import 'package:flutter/material.dart';

class FeelingActivityCard extends StatelessWidget {
  final FeelingAndActivity feelingAndActivity;

  const FeelingActivityCard(this.feelingAndActivity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5)
      ),
      child: Row(
        children: [
          Icon(feelingAndActivity.icons),
          Text(feelingAndActivity.status),
        ],
      ),
    );
  }
}
