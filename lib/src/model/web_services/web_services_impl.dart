import 'package:newsletter_for_mother/src/model/models/models.dart';
import 'package:newsletter_for_mother/src/model/web_services/web_services.dart';
import 'package:newsletter_for_mother/src/model/web_services/web_utils.dart';

class WebServicesImpl extends WebServices {
  @override
  Future<Result<List<NewsPost>>> getNewsPosts(int startIndex, int endIndex) async {
    return Result(getTestPosts(startIndex, endIndex), ResultStatus(200));
  }
}

List<NewsPost> getTestPosts(int startIndex, int endIndex) {
  var user1 = User(
      "q1w23e4r5t",
      "Panda",
      "Meditative",
      "https://ichef.bbci.co.uk/news/640/cpsprodpb/169F6/production/_91026629_gettyimages-519508400.jpg",
      DateTime(2019, 9, 8));
  var user2 = User(
      "q1w23e4r5p",
      "Cat",
      "Playful",
      "https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg",
      DateTime(2019, 7, 19));

  var postActions = PostActions(false, 16, 18, false);

  var posts = List<NewsPost>();

  for (int i = startIndex; i <= endIndex; i++) {
    var now = DateTime.now();
    var createTime =
        DateTime(now.year, now.month, now.day - i, now.hour, now.minute);

    posts.add(NewsPost(
      (98545323 + i).toString(),
      i % 2 == 0 ? user2 : user1,
      "Погодки $i",
      "Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.",
      i % 2 == 0
          ? "https://zaxid.net/resources/photos/news/640x360_DIR/201308/1290657.jpg"
          : "",
      createTime,
      postActions,
    ));
  }

  return posts;
}
