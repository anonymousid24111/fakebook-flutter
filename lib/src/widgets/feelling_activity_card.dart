import 'package:flutter/material.dart';

class FeelingActivityCard extends StatelessWidget {
  final String str;
  final IconData icon;

  const FeelingActivityCard({Key key, this.str, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5)
      ),
      child: Row(
        children: [
          Icon(icon),
          Text(str),
        ],
      ),
    );
  }
}
