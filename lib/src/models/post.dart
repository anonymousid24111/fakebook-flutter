import 'dart:convert';

import 'package:fakebook_flutter_app/src/models/comment.dart';
import 'package:fakebook_flutter_app/src/models/user.dart';

class PostModel {
  VideoPost video;
  List<CommentModel> comment_list;
  List<LikePost> like_list;
  String id;
  String described;
  String state;
  String status;
  String created;
  String modified;
  String like;
  bool is_liked;
  String comment;
  AuthorPost author;
  List<ImagePost> image;

  PostModel.empty();

  PostModel(
      this.video,
      this.comment_list,
      this.like_list,
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
      List<LikePost>.from(
          json['like_list'].map((x) => LikePost.fromJson(x)).toList()),
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

class LikePost {
  String username;

  LikePost(this.username);

  factory LikePost.fromJson(Map<String, dynamic> json) {
    return LikePost(json['username']);
  }
}

List<PostModel> list_posts = [
  new PostModel(
      null,
      [],
      [],
      "5fca01295010f800171b9887",
      "hihi",
      "alo",
      "",
      "2020-12-04T09:28:09.246Z",
      "2020-12-04T09:28:09.246Z",
      "0",
      false,
      "0",
      new AuthorPost("5fafb2dfc45ad72740427e77", "Giang To Cong Tu",
          "http://res.cloudinary.com/api-fakebook/image/upload/v1605687707/hoxzc1wbhpjxdfpjhr4i.jpg"),
      [
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
      ]),
  new PostModel(
      null,
      [],
      [],
      "5fca01295010f800171b9887",
      "hihi",
      "alo",
      "hao hung",
      "2020-12-04T09:28:09.246Z",
      "2020-12-04T09:28:09.246Z",
      "0",
      true,
      "0",
      new AuthorPost("5fafb2dfc45ad72740427e77", "Manh",
          "http://res.cloudinary.com/api-fakebook/image/upload/v1605687707/hoxzc1wbhpjxdfpjhr4i.jpg"),
      [
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
      ]),
  new PostModel(
      null,
      [],
      [],
      "5fca01295010f800171b9887",
      "When writing an app, you’ll commonly author new widgets that are subclasses of either StatelessWidget or StatefulWidget, depending on whether your widget manages any state. ",
      "alo",
      "",
      "2020-12-04T09:28:09.246Z",
      "2020-12-04T09:28:09.246Z",
      "0",
      false,
      "0",
      new AuthorPost("5fafb2dfc45ad72740427e77", "Manh",
          "http://res.cloudinary.com/api-fakebook/image/upload/v1605687707/hoxzc1wbhpjxdfpjhr4i.jpg"),
      [
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg")
      ]),
  new PostModel(
      null,
      [],
      [],
      "5fca01295010f800171b9887",
      "hihi",
      "alo",
      "",
      "2020-12-04T09:28:09.246Z",
      "2020-12-04T09:28:09.246Z",
      "0",
      false,
      "0",
      new AuthorPost("5fafb2dfc45ad72740427e77", "Manh",
          "http://res.cloudinary.com/api-fakebook/image/upload/v1605687707/hoxzc1wbhpjxdfpjhr4i.jpg"),
      [
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg"),
        new ImagePost(
            "http://res.cloudinary.com/api-fakebook/image/upload/v1607008662/wyohmznl7scivfgv7t2d.jpg")
      ]),
  new PostModel(
      null,
      [],
      [],
      "5fca01295010f800171b9887",
      "hihi",
      "alo",
      "",
      "2020-12-04T09:28:09.246Z",
      "2020-12-04T09:28:09.246Z",
      "0",
      false,
      "0",
      new AuthorPost("5fafb2dfc45ad72740427e77", "Manh",
          "http://res.cloudinary.com/api-fakebook/image/upload/v1605687707/hoxzc1wbhpjxdfpjhr4i.jpg"),
      [])
];
