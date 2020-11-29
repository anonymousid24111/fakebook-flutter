import 'package:fakebook_flutter_app/src/models/user.dart';

class CommentModel {
  String id="";
  UserModel poster = UserModel.empty();
  String comment = "";
  String v = "";


  CommentModel(this.id, this.poster, this.comment, this.v);

  CommentModel.empty();

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        json['id'],
        json['poster'],
        json['comment'],
        json['_v']
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
