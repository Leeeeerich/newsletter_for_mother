import 'package:newsletter_for_mother/src/model/models/models.dart';
import 'package:newsletter_for_mother/src/model/web_services/web_utils.dart';

abstract class WebServices {
  Future<Result<List<NewsPost>>> getNewsPosts(int startIndex, int endIndex);
}
