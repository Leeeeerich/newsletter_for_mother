import 'package:flutter/widgets.dart';
import 'package:newsletter_for_mother/src/model/models/models.dart';
import 'package:newsletter_for_mother/src/model/repository/repository.dart';

class NewsModel extends ChangeNotifier {
  final Repository _repository;

  ScrollController _scrollController;
  List<NewsPost> _posts = List();

  NewsModel(this._repository) {
    _scrollController = ScrollController();
    loadPosts(0, 9);
  }

  ScrollController get scrollController => _scrollController;

  List<NewsPost> get posts => _posts;

  loadPosts(int startIndex, int endIndex) {
    _repository.getPosts(startIndex, endIndex).then((value) {
      if (value.isSuccessful) {
        _posts = value.result;
      } else {
        //TODO show error message
      }
    });
  }
}
