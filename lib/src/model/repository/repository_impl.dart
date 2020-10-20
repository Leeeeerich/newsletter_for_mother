import 'dart:async';

import 'package:newsletter_for_mother/src/model/models/models.dart';
import 'package:newsletter_for_mother/src/model/repository/repository.dart';
import 'package:newsletter_for_mother/src/model/web_services/web_services.dart';
import 'package:newsletter_for_mother/src/model/web_services/web_utils.dart';

class RepositoryImpl extends Repository {
  final WebServices _services;

  RepositoryImpl(this._services);

  @override
  Future<Result<List<NewsPost>>> getPosts(int startIndex, int endIndex) {
    return _services.getNewsPosts(startIndex, endIndex);
  }
}
