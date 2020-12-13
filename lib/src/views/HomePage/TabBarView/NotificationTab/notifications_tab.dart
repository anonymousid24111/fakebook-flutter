import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/NotificationTab/notifications_controller.dart';
import 'package:fakebook_flutter_app/src/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:fakebook_flutter_app/src/widgets/notification_widget.dart';

class NotificationsTab extends StatefulWidget {
  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab>
    with AutomaticKeepAliveClientMixin {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  NotificationController notificationController = new NotificationController();

  List<dynamic> notifications = new List();

  bool isLoading = false;


  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      setState(() => isLoading = true);
      await notificationController.getNotification(onSuccess: (values) {
        setState(() {
          isLoading = false;
          notifications = values;
        });
      }, onError: (msg) {
        setState(() => isLoading = false);
        print(msg);
      });
    });
    super.initState();
  }

  Future<void> _refresh() async {
    refreshKey.currentState?.show(atTop: false);
    setState(() => isLoading = true);
    await notificationController.getNotification(onSuccess: (values) {
      setState(() {
        isLoading = false;
        notifications = values;
      });
    }, onError: (msg) {
      setState(() => isLoading = false);
      print(msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: RefreshIndicator(
          key: refreshKey,
          onRefresh: _refresh,
          child: isLoading
              ? LoadingNewFeed()
              : ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Thông báo',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.search),
                              color: Colors.black,
                              tooltip: 'search',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "home_search_screen");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (var notification in notifications)
                      NotificationWidget(notification: notification)
                  ],
                )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
