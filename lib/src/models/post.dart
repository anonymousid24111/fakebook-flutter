import 'dart:convert';

import 'package:flutter/cupertino.dart';

class PostModel{
  String id;
  String described;
  String created;
  String modified;
  String like;
  String comment;
  String is_liked;
  List<ImagePost> image;
  VideoPost video;
  AuthorPost author;
  String state;
  String is_block;
  String can_edit;
  String banned;
  String can_comment;

  PostModel.empty();

  PostModel(
      this.id,
      this.described,
      this.created,
      this.modified,
      this.like,
      this.comment,
      this.is_liked,
      this.image,
      this.video,
      this.author,
      this.state,
      this.is_block,
      this.can_edit,
      this.banned,
      this.can_comment,
      );



  factory PostModel.fromJson(Map<String, dynamic> json) {

    return PostModel(
      json['id'],
      json['described']??[],
      json['created'],
      json['modified'],
      json['like'],
      json['comment'],
      json['is_liked'],
      List<ImagePost>.from(json['image']??[].map((x)=>ImagePost.fromJson(x)).toList()),
      VideoPost.fromJson(json['video']??[]),
      AuthorPost.fromJson(json['author']),
      json['state'],
      json['is_bloked'],
      json['can_edit'],
      json['banned'],
      json['can_comment'],
    );
  }
}
class ImagePost{
  final String id;
  final String url;

  ImagePost(this.id, this.url);

  factory ImagePost.fromJson(Map<String, dynamic> json) {
    return ImagePost(
        json['id'],
        json['url'],
    );
  }
}
class VideoPost{
  final String url;
  final String thumb;

  VideoPost(this.url, this.thumb);

  factory VideoPost.fromJson(Map<String, dynamic> json) {
    return VideoPost(
        json['url'],
        json['thumb']
    );
  }
}
class AuthorPost{
  final String id;
  final String name;
  final String avatar;

  AuthorPost(this.id, this.name, this.avatar);

  factory AuthorPost.fromJson(Map<String, dynamic> json) {
    return AuthorPost(
        json['id'],
        json['name'],
        json['avatar']
    );
  }
/*
  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.avatar} }';
  }
*/
}