import 'package:flutter/material.dart';
import 'package:newsletter_for_mother/src/model/extensions.dart';
import 'package:newsletter_for_mother/src/model/models/models.dart';
import 'package:newsletter_for_mother/src/ui/home/news/news_model.dart';
import 'package:newsletter_for_mother/src/ui/utils.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreen createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsModel>(builder: (ctx, data, _) {
      return Stack(children: [
        Container(
          color: getColorFromHex("e5e5e5"),
          child: ListView(
            padding: EdgeInsets.only(
                top: data.header != null && !data.header.isClosed
                    ? HEADER_HEIGHT
                    : 0),
            controller: data.scrollController,
            children: _getItems(context, data.posts),
          ),
        ),
        Visibility(
            visible: data.header != null && !data.header.isClosed,
            child: _header(data.header)),
      ]);
    });
  }

  Widget _header(NewsHeader header) {
    if (header == null) return Container();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          _openArticleScreen(header.articleId);
        },
        child: Container(
          height: HEADER_HEIGHT - 16,
          padding: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(color: Colors.cyan),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_right_alt_outlined,
                            color: Colors.white),
                        Text(header.group,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        header.isClosed = true;
                        setState(
                            () {}); //TODO not best, because all list will redraw. Different stream widgets for list and header.
                      })
                ],
              ),
              Text(
                header.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getItems(BuildContext ctx, List<NewsPost> rawPosts) {
    var posts = List<Widget>();

    rawPosts.forEach((element) {
      posts.add(_item(ctx, element));
    });

    return posts;
  }

  Widget _item(BuildContext ctx, NewsPost post) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _headerPost(ctx, post),

            // Post image
            post.imageUrl.isNotEmpty
                ? Image.network(post.imageUrl, fit: BoxFit.fitWidth)
                : Container(),

            // Post title
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(post.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),

            // Post description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                post.description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Date post created
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(post.createTime.dateToString()), Text("")],
              ),
            ),

            // Actions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(height: 1, color: Colors.black12),
            ),
            _bottomPost(post.postActions),
          ],
        ),
      ),
    );
  }

  Widget _headerPost(BuildContext ctx, NewsPost post) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(post.user.userPhoto)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "${post.user.firstName} ${post.user.secondName}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Padding(
                padding: EdgeInsets.only(right: 8),
                child: _colorsLabel(getAgeYearsMonths(ctx, post.user.babyAge),
                    Colors.redAccent)),
            _colorsLabel(
                getAgeWeeks(ctx, post.user.babyAge), Colors.greenAccent),
          ],
        ));
  }

  Widget _colorsLabel(String text, Color color) {
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)), color: color),
    );
  }

  Widget _bottomPost(PostActions actions) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            _iconsButtonsWithCounter(
                actions.isLike ? Icons.favorite : Icons.favorite_border,
                actions.liked, () {
              actions.isLike =
                  !actions.isLike; //TODO It is mock, need sending status
              actions.isLike
                  ? actions.liked++
                  : actions.liked--; //TODO It is mock, need sending status
            }),
            _iconsButtonsWithCounter(
                Icons.messenger_outline, actions.comments, () {}),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ]),
          IconButton(
            icon: Icon(actions.isFavorite ? Icons.star : Icons.star_border),
            onPressed: () {
              actions.isFavorite =
                  !actions.isFavorite; //TODO It is mock, need sending status
            },
          ),
        ],
      ),
    );
  }

  Widget _iconsButtonsWithCounter(
      IconData icon, int counter, Function onClick) {
    return Row(
      children: [
        IconButton(
          onPressed: onClick,
          icon: Icon(icon),
        ),
        Text(counter.toString()),
      ],
    );
  }

  _openArticleScreen(String articleId) {
    // Navigator.pushNamed(context, Routes.ARTICLE, arguments: {articleId: articleId});
    showToast("OpenArticle screen");
  }

  static const HEADER_HEIGHT = 150.0;
}
