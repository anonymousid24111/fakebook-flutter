import 'dart:convert';

import 'package:fakebook_flutter_app/src/helpers/colors_constant.dart';
import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/loading_post_screen.dart';
import 'package:fakebook_flutter_app/src/helpers/screen.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/post_widget_controller.dart';
import 'package:fakebook_flutter_app/src/views/Search/searched_controller.dart';
import 'package:fakebook_flutter_app/src/widgets/post/post_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SaveSearchState createState() => _SaveSearchState();
}

class _SaveSearchState extends State<SearchPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TextEditingController textController = new TextEditingController();
  bool is_searched = false;
  TabController _tabController;

  String username;
  String avatar;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  bool isLoading = false;
  List<dynamic> provices = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);

    StorageUtil.getUsername().then((value) => setState(() {
          username = value;
        }));
    StorageUtil.getAvatar().then((value) => setState(() {
          avatar = value;
        }));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() => isLoading = true);
      await getSearch(onSuccess: (values) {
        setState(() {
          isLoading = false;
          provices = values;
        });
      }, onError: (msg) {
        setState(() => isLoading = false);
        print(msg);
      });
    });
  }

  Future<void> getSearch(
      {Function(List<dynamic>) onSuccess, Function(String) onError}) async {
    var response =
        await FetchData.getSaveSearchApi(await StorageUtil.getToken(), 0, 10);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["data"];
        onSuccess(data);
      } catch (e) {
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottomOpacity: 1,
          elevation: 0.0,
          backgroundColor: kColorWhite,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: kColorBlack,
            ),
            onPressed: () {
              if (is_searched) {
                setState(() {
                  textController.text = "";
                  is_searched = false;
                });
              } else
                Navigator.pop(context);
            },
          ),
          title: Container(
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              controller: textController,
              textAlignVertical: TextAlignVertical.center,
              autofocus: !is_searched,
              cursorWidth: 1,
              cursorHeight: 30,
              cursorColor: kColorGrey,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                border: InputBorder.none,
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(
                  fontSize: FontSize.s18,
                  color: kColorBlack,
                  //fontWeight: FontWeight.bold
                ),
                // TODO: Search Button
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      textController.text = "";
                      is_searched = false;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: kColorBlack.withOpacity(0.8),
                    //size: ConstScreen.setSizeWidth(45),
                  ),
                ),
              ),
              style: TextStyle(fontSize: FontSize.s24, color: kColorBlack),
              maxLines: 1,
              onSubmitted: (value) {
                setState(() {
                  value.isNotEmpty ? is_searched = true : is_searched = false;
                });
              },
              onChanged: (value) {
                setState(() {
                  //isSearch = true;
                });
              },
            ),
          ),
          bottom: !is_searched
              ? null
              : TabBar(
                  indicatorColor: kColorBlue,
                  controller: _tabController,
                  unselectedLabelColor: kColorBlack,
                  labelColor: kColorBlue,
                  tabs: [
                    Tab(
                      text: "Tất cả",
                    ),
                    Tab(
                      text: "Bài viết",
                    ),
                    Tab(
                      text: "Mọi người",
                    ),
                  ],
                ),
        ),
        body: is_searched
            ? TabBarView(
                controller: _tabController,
                children: [buildAllSearch(), Container(), Container()])
            : buildSavedSearchBody(),
      ),
    );
  }

  Widget buildSavedSearchBody() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: kColorGrey, width: 0.2)),
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          await getSearch(onSuccess: (values) {
            setState(() {
              isLoading = false;
              provices = values;
            });
          }, onError: (msg) {
            setState(() => isLoading = false);
            print(msg);
          });
        },
        child: ListView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 45,
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: kColorGrey, width: 0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mới đây",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      onPressed: () {},
                      child: Text("CHỈNH SỬA")),
                ],
              ),
            ),
            isLoading
                ? Center(
                    child: Text("loading..."),
                  )
                : provices.isEmpty
                    ? Center(
                        child: Text("empty"),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 3),
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provices.length,
                        itemBuilder: (context, index) {
                          String result = provices[index]['keyword'];
                          return FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                textController.text = result;
                                is_searched = true;
                              });
                            },
                            child: ListTile(
                              leading: Icon(Icons.search),
                              title: Text(result),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      provices.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.close)),
                            ),
                          );
                        }),

            /*
            StreamBuilder(
                stream: searchController.savedSearchStream,
                builder: (context, snapshot) {
                  print(snapshot.data ?? "clientnull");
                  if (snapshot.hasData) {
                    if (snapshot.data != "") {
                      var list = snapshot.data;
                      return ListView.builder(
                          padding: EdgeInsets.only(top: 3),
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            String result = list[index]['keyword'];
                            return FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  textController.text = result;
                                  is_searched = true;
                                });
                              },
                              child: ListTile(
                                leading: Icon(Icons.search),
                                title: Text(result),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        list.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.close)),
                              ),
                            );
                          });
                    }
                    if (snapshot.data == "") {
                      print(snapshot.data ?? "nothing1");
                      return Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator()));
                    }
                  }
                  if (snapshot.hasError) {
                    print(snapshot.data ?? "nothing2");
                    return Center(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 50),
                              child: Text(snapshot.error)),
                          GestureDetector(
                            onTap: () {
                              searchController.getSavedSearch();
                            },
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset("assets/nointernet.png")),
                          )
                        ],
                      ),
                    );
                  } else {
                    searchController.getSavedSearch();
                    return SizedBox.shrink();
                    //return loadingBody();
                  }
                  /*
                  if (snapshot.hasData) {
                    var list = snapshot.data;
                    return ListView.builder(
                        padding: EdgeInsets.only(top: 3),
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          String result = list[index]['keyword'];
                          return FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                textController.text = result;
                                is_searched = true;
                              });
                            },
                            child: ListTile(
                              leading: Icon(Icons.search),
                              title: Text(result),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      list.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.close)),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    if (snapshot.error == "loading")
                      return Center(
                          child: SizedBox(
                              width: 20, child: CircularProgressIndicator()));
                    else
                      return Center(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 50),
                                child: Text(snapshot.error)),
                            GestureDetector(
                              onTap: () {
                                searchController.getSavedSearch();
                              },
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset("assets/nointernet.png")),
                            )
                          ],
                        ),
                      );
                  } else {
                    searchController.getSavedSearch();
                    return SizedBox.shrink();
                    //return loadingBody();
                  }

                  */
                }),





            */
          ],
        ),
      ),
    );
  }

  Widget buildAllSearch() {
    return Container(
      color: Colors.grey[300],
      child: buildResultSearchBody(),
    );
  }

  Widget buildResultSearchBody() {
    return StreamBuilder(
      stream: searchController.searchStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != "" && snapshot.data != [])
            return ListView.builder(
                padding: EdgeInsets.only(top: 3),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return PostWidget(
                    post: snapshot.data[index],
                    controller: new PostController(),
                    username: username,
                  );
                });
          if (snapshot.data == "") return LoadingPost();
          if (snapshot.data == []) {
            print("aa");
            return Container(
              width: 600,
              height: 500,
              color: kColorWhite,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Rất tiếc, chúng tôi không tìm thấy kết",
                      style: TextStyle(color: kColorBlack),
                    ),
                    Text("quả nào phù hợp"),
                  ],
                ),
              ),
            );
          }
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    child: Text(snapshot.error)),
                GestureDetector(
                  onTap: () {
                    searchController.search(textController.text);
                  },
                  child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/nointernet.png")),
                )
              ],
            ),
          );
        } else {
          searchController.search(textController.text);
          return SizedBox.shrink();
          //return loadingBody();
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
}

class SavedSearch extends StatefulWidget {
  @override
  _SavedSearchState createState() => _SavedSearchState();
}

class _SavedSearchState extends State<SavedSearch> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Container searchBox(
    {onTapFunction,
    onChangedFunction,
    onEditingCompleteFunction,
    onSubmittedFunction,
    autoFocus = false,
    hintText = 'Tìm kiếm'}) {
  return Container(
    height: 38,
    decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Color(0xFFFFFFFF), width: 0.0)),
    child: TextField(
      autofocus: autoFocus,
      onTap: onTapFunction,
      onChanged: onChangedFunction,
      onEditingComplete: onEditingCompleteFunction,
      onSubmitted: onSubmittedFunction,
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 6),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFFFFF),
            width: 0.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.0,
            color: Color(0xFFFFFFFF),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gapPadding: 0,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xFF757575),
        ),
        hintText: '$hintText',
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gapPadding: 0,
        ),
      ),
    ),
  );
}
