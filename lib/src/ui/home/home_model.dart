import 'package:flutter/widgets.dart';
import 'package:newsletter_for_mother/src/model/repository/repository.dart';

class HomeModel extends ChangeNotifier {
  final Repository _repository;

  HomeModel(this._repository);
}
