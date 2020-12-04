import 'package:fakebook_flutter_app/src/models/user.dart';

class CommentModel {
  String id;
  CommentPoster poster;
  String comment;
  String created;

  CommentModel(this.id, this.poster, this.comment, this.created);

  CommentModel.empty();

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      json['id'],
      CommentPoster.fromJson(json['poster']),
      json['comment'],
      json['created'],
    );
  }
  /*
  Map toMap() => new Map<String, dynamic>.from({
        "user": this.user.userToMap(),
        "comment": this.comment,
      });

  static List<Map> toListMap(List<Comment> comments) {
    List<Map> maps = [];
    comments.forEach((Comment comment) {
      Map step = comment.toMap();
      maps.add(step);
    });
    return maps;
  }

  static List<Comment> fromListMap(List<Map> maps) {
    List<Comment> comments = [];
    maps.forEach((element) {
      comments.add(Comment.fromJson(element));
    });
    return comments;
  }

   */
}

class CommentPoster {
  final String id;
  final String username;
  final String avatar;

  CommentPoster(this.id, this.username, this.avatar);

  factory CommentPoster.fromJson(Map<String, dynamic> json) {
    return CommentPoster(
      json['id'],
      json['avatar'],
      json['username'],
    );
  }
}
