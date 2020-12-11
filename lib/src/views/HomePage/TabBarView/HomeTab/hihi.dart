import 'dart:convert';

import 'package:fakebook_flutter_app/src/apis/api_send.dart';
import 'package:fakebook_flutter_app/src/helpers/fetch_data.dart';
import 'package:fakebook_flutter_app/src/helpers/shared_preferences.dart';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/home_tab.dart';
import 'package:fakebook_flutter_app/src/views/HomePage/TabBarView/HomeTab/post_widget_controller.dart';
import 'package:fakebook_flutter_app/src/widgets/loading_shimmer.dart';
import 'package:fakebook_flutter_app/src/widgets/post/header_post_widget.dart';
import 'package:fakebook_flutter_app/src/widgets/post/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CharacterListView extends StatefulWidget {
  @override
  _CharacterListViewState createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> with AutomaticKeepAliveClientMixin{
  String username;
  String avatar;

  static const _pageSize = 1;

  final PagingController<int, PostModel> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 2);

  @override
  void initState() {
    StorageUtil.getUsername().then((value) => setState(() {
          username = value;
        }));
    StorageUtil.getAvatar().then((value) => setState(() {
          avatar = value;
        }));

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  List<PostModel> parsePosts(Map<String, dynamic> json) {
    List<PostModel> temp;
    try {
      temp = (json['posts'] as List).map((x) => PostModel.fromJson(x)).toList();
    } catch (e) {
      print(e.toString());
    }
    return temp;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await ApiService.getListPosts(await StorageUtil.getToken(), pageKey, 2)
          .then((val) {
        if (val["code"] == 1000) {
          final newItems = parsePosts(val['data']);
          final isLastPage = newItems.length < _pageSize;
          if (isLastPage) {
            _pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + newItems.length;
            _pagingController.appendPage(newItems, nextPageKey);
          }
        } else {
          _pagingController.error = "jvsvn";
        }
      });
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              HeaderHome(),
              PagedListView<int, PostModel>(
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<PostModel>(
                  itemBuilder: (context, item, index) => PostWidget(
                    post: item,
                    controller: new PostController(),
                    username: username,
                  ),
                  firstPageProgressIndicatorBuilder: (_) => LoadingNewFeed(),
                  //newPageProgressIndicatorBuilder: (_) => NewPageProgressIndicator(),
                  //noItemsFoundIndicatorBuilder: (_) => NoItemsFoundIndicator(),
                  //noMoreItemsIndicatorBuilder: (_) => NoMoreItemsIndicator(),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
