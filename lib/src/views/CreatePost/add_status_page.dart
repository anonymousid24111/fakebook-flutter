import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/widgets/feelling_activity_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeelingAndActivity {
  String _status;
  IconData _icons;

  FeelingAndActivity(this._status, this._icons);

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  IconData get icons => _icons;

  set icons(IconData value) {
    _icons = value;
  }
/*
  List<FeelingAndActivity> list = [
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("hanh phuc", Icons.add),
  ];

 */
}

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> with TickerProviderStateMixin {
  TabController tabController;
  //FeelingAndActivity feelingAndActivity = new FeelingAndActivity.empty();

  List<FeelingAndActivity> list = [
    new FeelingAndActivity("hanh phuc", Icons.add),
    new FeelingAndActivity("vui ve", Icons.add),
    new FeelingAndActivity("buon", Icons.add),
    new FeelingAndActivity("hung phan", Icons.add),
    new FeelingAndActivity("ngoc nghech vai ca dai", Icons.add),
    new FeelingAndActivity("sung suong", Icons.add),
    new FeelingAndActivity("dang yeu", Icons.add),
    new FeelingAndActivity("tuyet voi", Icons.add),
  ];

/*
  List<FeelingActivityCard> list = [
    FeelingActivityCard(str: "hạnh phúc", icon: Icons.add),
    FeelingActivityCard(str: "buồn", icon: Icons.add),
    FeelingActivityCard(str: "đáng yêu", icon: Icons.add),
    FeelingActivityCard(str: "sung sướng", icon: Icons.add),
    FeelingActivityCard(str: "tuyệt vời", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "hạnh phúc", icon: Icons.add),
    FeelingActivityCard(str: "buồn", icon: Icons.add),
    FeelingActivityCard(str: "đáng yêu", icon: Icons.add),
    FeelingActivityCard(str: "sung sướng", icon: Icons.add),
    FeelingActivityCard(str: "tuyệt vời", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
    FeelingActivityCard(str: "ngốc nghếch", icon: Icons.add),
  ];

 */

  //Future<String> deviceId = _getId();

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this);

    var tabBarItem = new TabBar(
      indicatorColor: Colors.blueAccent,
      unselectedLabelColor: kColorBlack,
      labelColor: Colors.blueAccent,
      tabs: [
        new Tab(
          text: "CẢM XÚC",
        ),
        new Tab(
          text: "HOẠT ĐỘNG",
        ),
      ],
      controller: tabController,
      //indicatorColor: Colors.white,
    );

    var listItem = new ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new Text(
                ":) $index",
                style: TextStyle(fontFamily: "emoji"),
              ),
            ),
          ),
          onTap: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("ListView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ));
          },
        );
      },
    );

    var gridView = new GridView.builder(
        itemCount: list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: FeelingActivityCard(
              list[index],
            ),
            onTap: () {
              Navigator.pop(context, list[index]);
            },
          );
        });

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: kColorWhite,
          textTheme: TextTheme(
            button: TextStyle(color: kColorBlack),
            caption: TextStyle(color: kColorBlack),
          ),

          //shape: Border.fromBorderSide(BorderSide(color: Colors.black)),
          leading: IconButton(
            color: kColorBlack,
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: new Text(
            "Bạn đang cảm thấy thế nào?",
            style: TextStyle(color: kColorBlack),
          ),
          bottom: tabBarItem,
        ),
        body: new TabBarView(
          controller: tabController,
          children: [
            gridView,
            Scaffold(),
          ],
        ),
      ),
    );
  }
}
