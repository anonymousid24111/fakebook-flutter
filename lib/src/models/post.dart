import 'dart:convert';

import 'package:fakebook_flutter_app/src/models/comment.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';

class PostModel {
  VideoPost video;
  List<CommentModel> comment_list;
  String id;
  String described;
  String state;
  String status;
  String created;
  String modified;
  String like;
  String is_liked;
  String comment;
  AuthorPost author;
  List<ImagePost> image;

  PostModel.empty();

  PostModel(
      this.video,
      this.comment_list,
      this.id,
      this.described,
      this.state,
      this.status,
      this.created,
      this.modified,
      this.like,
      this.is_liked,
      this.comment,
      this.author,
      this.image);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      VideoPost.fromJson(json['video']),
      List<CommentModel>.from(
          json['comment_list'].map((x) => CommentModel.fromJson(x)).toList()),
      json['id'],
      json['described'],
      json['state'],
      json['status'],
      json['created'],
      json['modified'],
      json['like'],
      json['is_liked'],
      json['comment'],
      AuthorPost.fromJson(json['author']),
      List<ImagePost>.from(
          json['image'].map((x) => ImagePost.fromJson(x)).toList()),
    );
  }
}

class AuthorPost {
  final String id;
  final String username;
  final String avatar;

  AuthorPost(this.id, this.username, this.avatar);

  factory AuthorPost.fromJson(Map<String, dynamic> json) {
    return AuthorPost(
      json['id'],
      json['avatar'],
      json['username'],
    );
  }
}

class ImagePost {
  final String url;

  ImagePost(this.url);

  factory ImagePost.fromJson(Map<String, dynamic> json) {
    return ImagePost(
      json['url'],
    );
  }
}

class VideoPost {
  final String url;
  final String thumb;

  VideoPost(this.url, this.thumb);

  factory VideoPost.fromJson(Map<String, dynamic> json) {
    return VideoPost(json['url'], json['thumb']);
  }
}
