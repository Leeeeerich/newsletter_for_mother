import 'package:flutter/material.dart';
import 'package:newsletter_for_mother/src/model/constants/fields.dart';

class User {
  String _userId;
  String _firstName;
  String _secondName;
  String _userPhoto;
  DateTime _babyAge;

  User(this._userId, this._firstName, this._secondName, this._userPhoto,
      this._babyAge);

  String get userId => _userId;

  String get firstName => _firstName;

  String get secondName => _secondName;

  String get userPhoto => _userPhoto;

  DateTime get babyAge => _babyAge;

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        map[Fields.USER_ID],
        map[Fields.FIRST_NAME],
        map[Fields.SECOND_NAME],
        map[Fields.USER_PHOTO_URL],
        map[Fields.BABY_AGE].toDate());
  }
}

class PostActions {
  bool isLike;
  int liked;
  int comments;
  bool isFavorite;

  PostActions(this.isLike, this.liked, this.comments, this.isFavorite);

  factory PostActions.fromMap(Map<String, dynamic> map) {
    return PostActions(
      map['is_like'],
      map['liked'],
      map['comments'],
      map['is_favorite'],
    );
  }
}

class NewsPost {
  String _postId;
  User _user;
  String _title;
  String _description;
  String _imageUrl;
  DateTime _createTime;
  PostActions _postActions;

  NewsPost(this._postId, this._user, this._title, this._description,
      this._imageUrl, this._createTime, this._postActions);

  User get user => _user;

  String get title => _title;

  String get description => _description;

  String get imageUrl => _imageUrl;

  DateTime get createTime => _createTime;

  PostActions get postActions => _postActions;

  factory NewsPost.fromMap(Map<String, dynamic> map) {
    return NewsPost(
      map[Fields.POST_ID],
      User.fromMap(map[Fields.USER]),
      map[Fields.TITLE_POST],
      map[Fields.DESCRIPTION_POST],
      map[Fields.IMAGES_POST_URL],
      map[Fields.CREATE_TIME].toDate(),
      PostActions.fromMap(map['post_actions']),
    );
  }
}

class NewsHeader {
  String articleId;
  String title;
  String group;
  bool isClosed = false;

  NewsHeader(
      {@required this.articleId, @required this.title, @required this.group});
}
