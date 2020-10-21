import 'package:flutter/material.dart';

class TabViewWithDivider extends StatelessWidget
    implements PreferredSizeWidget {
  final TabController _tabController;
  List<Widget> tabs;

  TabViewWithDivider(this._tabController,
      {@required double appBarHeight, @required this.tabs}) {
    preferredSize = Size(double.infinity, appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
        TabBar(
          controller: _tabController,
          tabs: tabs,
        )
      ],
    );
  }

  @override
  Size preferredSize;
}
