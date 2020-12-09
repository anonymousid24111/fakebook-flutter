import 'dart:async';

class PostController {
  StreamController _isLiked = new StreamController.broadcast();

  Stream get isLikedStream => _isLiked.stream;

  bool likeBehavior(bool is_liked) {
    _isLiked.sink.add(is_liked);
    /*
    if (is_liked)
      _like.sink.add(1);
    else
      _like.sink.add(0);
     */
    return is_liked;
  }

  void dispose() {
    _isLiked.close();
  }
}

List<PostController> postController;
