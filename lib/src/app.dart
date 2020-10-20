import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsletter_for_mother/src/model/constants/base_constants.dart';
import 'package:newsletter_for_mother/src/model/repository/repository.dart';
import 'package:newsletter_for_mother/src/model/web_services/web_services.dart';
import 'package:newsletter_for_mother/src/model/web_services/web_services_impl.dart';
import 'package:newsletter_for_mother/src/ui/home/news/news_model.dart';
import 'package:newsletter_for_mother/src/ui/utils.dart';
import 'package:provider/provider.dart';

import 'model/repository/repository_impl.dart';
import 'ui/home/home_model.dart';
import 'ui/home/home_screen.dart';

class App extends StatelessWidget {
  final FlutterI18nDelegate _i18Delegate;
  WebServices _webServices;
  Repository _repository;

  App(this._i18Delegate) : super();

  @override
  Widget build(BuildContext context) {
    _prepare();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => HomeModel(_repository)),
        ChangeNotifierProvider(create: (ctx) => NewsModel(_repository))
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: getColorFromHex("#f5f5f5")),
        localizationsDelegates: [
          _i18Delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        initialRoute: Routes.HOME,
        routes: {
          Routes.HOME: (ctx) => HomeScreen(),
        },
      ),
    );
  }

  Future<bool> _prepare() async {
    try {
      _webServices = WebServicesImpl();
      _repository = RepositoryImpl(_webServices);
      return true;
    } catch (e) {
      showToast("Init error = $e");
      print("Init error = $e");
      return false;
    }
  }
}
