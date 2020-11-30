import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/FriendTab/friends_tab.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/WatchTab/watch_tab.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/NotificationTab/notifications_tab.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/MenuTab/menu_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fakebook_flutter_app/src/views/Chat/home_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('facebook',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Icon(Icons.search, color: Colors.black),
                SizedBox(width: 15.0),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                    child: Icon(FontAwesomeIcons.facebookMessenger,
                        color: Colors.black))
              ]),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          bottom: TabBar(
            indicatorColor: kColorBlue,
            controller: _tabController,
            unselectedLabelColor: kColorBlack,
            labelColor: kColorBlue,
            tabs: [
              Tab(icon: Icon(Icons.home_outlined, size: 30.0)),
              Tab(icon: Icon(Icons.people, size: 30.0)),
              Tab(icon: Icon(Icons.ondemand_video, size: 30.0)),
              Tab(icon: Icon(Icons.notifications, size: 30.0)),
              Tab(icon: Icon(Icons.menu, size: 30.0))
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          HomeTab(),
          FriendsTab(),
          WatchTab(),
          NotificationsTab(),
          MenuTab()
        ]),
      ),
    );
  }
}
