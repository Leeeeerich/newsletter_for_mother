import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: I18nText("coming_soon_label"));
  }
}
