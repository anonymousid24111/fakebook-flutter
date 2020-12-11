import 'dart:async';

class PostController {
  StreamController _isLiked = new StreamController.broadcast();
  StreamController _likeNumber = new StreamController.broadcast();
  StreamController _commentNumber = new StreamController.broadcast();

  Stream get isLikedStream => _isLiked.stream;
  Stream get likeNumberStream => _likeNumber.stream;
  Stream get commentNumberStream => _commentNumber.stream;

  void init(bool is_liked, String like, String comment) {
    _isLiked.sink.add(is_liked);
    _likeNumber.sink.add(like);
    _commentNumber.sink.add(comment);
  }

  void likeBehavior(bool is_liked, String like) {
    _isLiked.sink.add(is_liked);
    is_liked
        ? _likeNumber.sink.add("${int.parse(like) + 1}")
        : _likeNumber.sink.add("${int.parse(like) + 1}");
    //return is_liked;
  }





  void dispose() {
    _isLiked.close();
    _likeNumber.close();
    _commentNumber.close();
  }
}

List<PostController> postController;
