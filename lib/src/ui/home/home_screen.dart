import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsletter_for_mother/src/ui/custom/tab_view_with_divider.dart';
import 'package:newsletter_for_mother/src/ui/home/popular/popular_screen.dart';
import 'package:newsletter_for_mother/src/ui/home/subscribes/subscribes_screen.dart';
import 'package:newsletter_for_mother/src/ui/utils.dart';

import 'news/news_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 8, top: 8),
          child: Row(children: [
            Container(
                padding: EdgeInsets.all(4),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
                child: Icon(
                  Icons.list,
                  color: Colors.white,
                )),
            Padding(
                padding: EdgeInsets.only(left: 8),
                child: I18nText("news_title")),
          ]),
        ),
        // backgroundColor: Colors.gre,
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/ic_marker.svg"),
            onPressed: () {},
            color: Colors.black87,
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/ic_search.svg"),
            onPressed: () {
              showToast("Clicked");
            },
          ),
        ],
        bottom: TabViewWithDivider(
          _tabController,
          appBarHeight: 56,
          tabs: [
            Tab(text: FlutterI18n.translate(context, "news_title")),
            Tab(text: FlutterI18n.translate(context, "populars_title")),
            Tab(text: FlutterI18n.translate(context, "subscribes_title"))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NewsScreen(),
          PopularScreen(),
          SubscribesScreen(),
        ],
      ),
    );
  }
}
